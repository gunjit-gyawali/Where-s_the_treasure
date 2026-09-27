extends Control

@onready var label = $Label

func _ready():
	EventController.connect("clues_collected", _on_event_clues_collected)
	
func _on_event_clues_collected(value: int) -> void:
	label.text = str(value)
