extends CanvasLayer

signal back_pressed

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton

var fullScreen = false

func _ready():
	backButton.connect("pressed", self, "on_back_entered")
	windowModeButton.connect("pressed", self, "on_window_mode_entered")	
	update_diplay()

func update_diplay():
	windowModeButton.text = "WINDOWED" if !fullScreen else "FULLSCREEN"
	
func on_back_entered():
	emit_signal("back_pressed")

func on_window_mode_entered():
	fullScreen = !fullScreen
	OS.window_fullscreen = fullScreen
	update_diplay()
