extends Node2D

func _ready() -> void:
	BgMusic.play_game_music()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GameController.total_clues >= 8:
		get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	else:
		pass


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GameController.total_clues >= 19:
		get_tree().change_scene_to_file("res://scenes/boss_lair.tscn")
	else:
		pass
