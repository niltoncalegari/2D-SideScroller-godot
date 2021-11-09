extends CanvasLayer

func _ready() -> void:
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/ContinueButton.connect("pressed", self, "on_next_button_pressed")
	$MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton.connect("pressed", self, "on_restart_button_pressed")
func on_next_button_pressed():
	$"/root/LevelManager".increment_level()
func on_restart_button_pressed():
	$"/root/LevelManager".restart_level()
