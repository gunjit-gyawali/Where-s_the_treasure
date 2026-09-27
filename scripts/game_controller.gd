extends Node


var total_clues: int = 0

func clues_collected(value: int):
	total_clues += value
	EventController.emit_signal("clues_collected", total_clues)
