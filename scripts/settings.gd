extends Node2D


func _on_game_5_pressed() -> void:
	$pressed.play()
	await $pressed.finished
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_game_7_pressed() -> void:
	$pressed.play()
	await $pressed.finished
	get_tree().change_scene_to_file("res://scenes/main_menu_1.tscn")


func _on_game_5_mouse_entered() -> void:
	$hover.play()


func _on_game_7_mouse_entered() -> void:
	$hover.play()
