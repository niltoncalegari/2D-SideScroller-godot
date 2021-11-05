extends CanvasLayer

onready var continueButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	continueButton.connect("pressed", self, "on_continue_pressed")
	
func on_continue_pressed():
	$"/root/ScreenTransitionManager".transition_to_menu()
