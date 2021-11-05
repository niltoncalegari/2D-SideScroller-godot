extends CanvasLayer

onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/PlayButton
onready var optionsButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/OptionsButton
onready var quitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	playButton.connect("pressed", self, "on_pressed_play")
	quitButton.connect("pressed", self, "on_pressed_quit")
	optionsButton.connect("pressed", self, "on_pressed_options")

func on_pressed_play():
	$"/root/LevelManager".change_level(0)

func on_pressed_quit():
	get_tree().quit()

func on_pressed_options():
	$"/root/ScreenTransitionManager".transition_to_scene("res://scenes/OptionsMenuStandalone.tscn")
