extends Node2D


func _on_game_pressed() -> void:
	$pressed1.play()
	await $pressed1.finished
	get_tree().change_scene_to_file("res://scenes/end.tscn")


func _on_game_mouse_entered() -> void:
	$hover1.play()
