extends Node2D


func _on_game_pressed() -> void:
	$pressed1.play()
	await $pressed1.finished
	get_tree().change_scene_to_file("res://scenes/1_st_world.tscn")


func _on_game_2_pressed() -> void:
	$pressed1.play()
	await $pressed1.finished
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_game_3_pressed() -> void:
	$pressed1.play()
	await $pressed1.finished
	get_tree().quit()


func _on_game_mouse_entered() -> void:
	$hover1.play()


func _on_game_2_mouse_entered() -> void:
	$hover1.play()


func _on_game_3_mouse_entered() -> void:
	$hover1.play()
