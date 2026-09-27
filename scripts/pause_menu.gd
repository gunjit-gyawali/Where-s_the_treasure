extends CanvasLayer


func _ready() -> void:
	visible = false
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_INHERIT
	process_mode = Node. PROCESS_MODE_PAUSABLE
	process_mode = Node. PROCESS_MODE_WHEN_PAUSED
	process_mode = Node. PROCESS_MODE_ALWAYS
	process_mode = Node. PROCESS_MODE_DISABLED
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_game_pressed() -> void:
	visible = false
	get_tree().paused = false
