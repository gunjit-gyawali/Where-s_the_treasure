class_name Enemy
extends CharacterBody2D

@export var speed: float = 40.0

var player: Node2D = null
var player_chase: bool = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	if player_chase and is_instance_valid(player):
		var target: Vector2 = _player_target()
		var direction: Vector2 = global_position.direction_to(target)
		velocity = direction * speed
		move_and_slide()

		if direction.x != 0.0:
			sprite.flip_h = direction.x < 0.0
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
