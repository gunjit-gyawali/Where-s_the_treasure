extends Control

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused


func _on_game_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_game_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/1_st_world.tscn")
	
func _on_game_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu_1.tscn")
