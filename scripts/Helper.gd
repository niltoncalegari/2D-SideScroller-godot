extends Node

func _ready() -> void:
	pass # Replace with function body.

func apply_camera_shake(percentage):
	var cameras = get_tree().get_nodes_in_group("camera")
	if (cameras.size() > 0):
		cameras[0].apply_shake(percentage)
