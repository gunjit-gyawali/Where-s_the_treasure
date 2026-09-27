

extends CharacterBody2D

@export var speed: float = 40.0

var can_take_damage = true

var is_dead = false

var health = 100
var player_inattack_zone = false

var player: Node2D = null
var player_chase: bool = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	deal_damage()
	update_health()
	
	
	if player_chase and is_instance_valid(player):
		var target: Vector2 = _player_target()
		var direction: Vector2 = global_position.direction_to(target)
		velocity = direction * speed
		move_and_slide()

		if direction.x != 0.0:
			sprite.flip_h = direction.x > 0.0
		sprite.play("walk")
	else:
		velocity = Vector2.ZERO
		sprite.play("idle")


func _player_target() -> Vector2:
	var player_sprite: Node2D = player.get_node_or_null("AnimatedSprite2D")
	if player_sprite != null:
		return player_sprite.global_position
	return player.global_position


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body: Node2D) -> void:
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_inattack_zone = false
		
func deal_damage():
	if is_dead:
		return

	if player_inattack_zone and Global.current_player_attack:
		if can_take_damage:
			health -= 10
			$take_damage_cooldown.start()
			can_take_damage = false

			print("boss health: ", health)

			if health <= 0:
				is_dead = true
				velocity = Vector2.ZERO
				$after_death.start()
				$enemy_hitbox.queue_free()
				$detection_area.queue_free()
				$AnimatedSprite2D.play("death")



func _on_take_damage_cooldown_timeout() -> void:
	can_take_damage = true

func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health == 100:
		healthbar.visible = false
	else:
		healthbar.visible = true


func _on_after_death_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/end.tscn")
