extends Node2D

func _ready() -> void:
	BgMusic.play_game_music()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/world_2.tscn")
	else:
		pass
