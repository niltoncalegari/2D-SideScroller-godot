extends CanvasLayer

signal screen_covered

func _ready():
	pass # Replace with function body.

func emit_screen_covered():
	emit_signal("screen_covered")
