extends Node2D

@export var value: int = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):

		
		GameController.clues_collected(1)
		$collect.play()
		await $collect.finished
		
		queue_free()
