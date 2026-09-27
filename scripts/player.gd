extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 400
var player_alive = true
var attack_ip = false

const speed = 100

var current_direction = "none"
var last_direction = "front"


func _ready() -> void:
	$AnimatedSprite2D.play("front_idle")

func _physics_process(_delta: float) -> void:
	_player_movement()
	enemy_attack()
	attack()
	update_health()

	if health <= 0:
		player_alive = false
		health = 0
		print("player died")
		get_tree().change_scene_to_file("res://scenes/you_died.tscn")


func _player_movement() -> void:
	if Input.is_action_just_pressed("front"):
		current_direction = "front"
	elif Input.is_action_just_pressed("right"):
		current_direction = "right"
	elif Input.is_action_just_pressed("left"):
		current_direction = "left"
	elif Input.is_action_just_pressed("up"):
		current_direction = "up"

	if current_direction == "front" and not Input.is_action_pressed("front"):
		_find_held_direction()
	elif current_direction == "right" and not Input.is_action_pressed("right"):
		_find_held_direction()
	elif current_direction == "left" and not Input.is_action_pressed("left"):
		_find_held_direction()
	elif current_direction == "up" and not Input.is_action_pressed("up"):
		_find_held_direction()

	if current_direction == "front":
		last_direction = "front"
		velocity = Vector2(0, speed)
	elif current_direction == "right":
		last_direction = "right"
		velocity = Vector2(speed, 0)
	elif current_direction == "left":
		last_direction = "left"
		velocity = Vector2(-speed, 0)
	elif current_direction == "up":
		last_direction = "up"
		velocity = Vector2(0, -speed)
	else:
		velocity = Vector2.ZERO

	if not attack_ip:
		if velocity == Vector2.ZERO:
			play_anim(0)
		else:
			play_anim(1)

	move_and_slide()


func _find_held_direction() -> void:
	if Input.is_action_pressed("front"):
		current_direction = "front"
	elif Input.is_action_pressed("right"):
		current_direction = "right"
	elif Input.is_action_pressed("left"):
		current_direction = "left"
	elif Input.is_action_pressed("up"):
		current_direction = "up"
	else:
		current_direction = "none"


func play_anim(movement: int) -> void:
	var anim: AnimatedSprite2D = $AnimatedSprite2D

	if movement == 0:
		if last_direction == "right":
			anim.flip_h = false
			anim.play("side_idle")
		elif last_direction == "left":
			anim.flip_h = true
			anim.play("side_idle")
		elif last_direction == "front":
			anim.flip_h = false
			anim.play("front_idle")
		elif last_direction == "up":
			anim.flip_h = false
			anim.play("back_idle")

	elif movement == 1:
		if current_direction == "right":
			anim.flip_h = false
			anim.play("side_walk")
		elif current_direction == "left":
			anim.flip_h = true
			anim.play("side_walk")
		elif current_direction == "front":
			anim.flip_h = false
			anim.play("front_walk")
		elif current_direction == "up":
			anim.flip_h = false
			anim.play("back_walk")


func player():
	pass


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false


func enemy_attack() -> void:
	if enemy_inattack_range and enemy_attack_cooldown:
		health -= 20
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)


func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true


func attack() -> void:
	if Input.is_action_just_pressed("attack") and not attack_ip:
		var dir = last_direction

		Global.current_player_attack = true
		attack_ip = true

		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
		elif dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
		elif dir == "front":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("front_attack")
		elif dir == "up":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("back_attack")

		$deal_attack_timer.start()


func _on_deal_attack_timer_timeout() -> void:
	$deal_attack_timer.stop()
	Global.current_player_attack = false
	attack_ip = false


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health == 400:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regen_timer_timeout() -> void:
	
	if health < 400:
		health = health + 20
		if health > 400:
			health = 400
	if health <= 0:
		health = 0
