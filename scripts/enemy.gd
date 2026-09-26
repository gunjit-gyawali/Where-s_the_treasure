class_name Enemy
extends CharacterBody2D

<<<<<<< HEAD
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
=======
@export var SPEED := 60.0
@export var DETECTION_RANGE := 300.0

var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if player == null:
		return

	var distance := global_position.distance_to(player.global_position)

	if distance <= DETECTION_RANGE:
		var direction := (player.global_position - global_position).normalized()
		velocity = direction * SPEED
>>>>>>> 8cc1603 (1st world)
	else:
		velocity = Vector2.ZERO
		sprite.play("idle")


func _player_target() -> Vector2:
	var player_sprite: Node2D = player.get_node_or_null("AnimatedSprite2D")
	if player_sprite != null:
		return player_sprite.global_position
	return player.global_position

<<<<<<< HEAD

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body: Node2D) -> void:
	player = null
	player_chase = false
=======
	move_and_slide()
>>>>>>> 8cc1603 (1st world)
