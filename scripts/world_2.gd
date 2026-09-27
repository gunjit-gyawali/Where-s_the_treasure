extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/1_st_world.tscn")
	else:
		pass
		
	
