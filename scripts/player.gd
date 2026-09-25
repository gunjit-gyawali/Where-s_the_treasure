extends CharacterBody2D

const speed = 100
var current_direction = "none"
var last_direction = "front"

func _ready() -> void:
	$AnimatedSprite2D.play("front_idle")

func _physics_process(_delta: float) -> void:
	_player_movement()

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
		play_anim(1)

	elif current_direction == "right":
		last_direction = "right"
		velocity = Vector2(speed, 0)
		play_anim(1)

	elif current_direction == "left":
		last_direction = "left"
		velocity = Vector2(-speed, 0)
		play_anim(1)

	elif current_direction == "up":
		last_direction = "up"
		velocity = Vector2(0, -speed)
		play_anim(1)

	else:
		velocity = Vector2.ZERO
		play_anim(0)

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

	elif current_direction == "right":
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
