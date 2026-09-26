extends Node2D


func _on_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/1_st_world.tscn")


func _on_game_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_game_3_pressed() -> void:
	get_tree().quit()
