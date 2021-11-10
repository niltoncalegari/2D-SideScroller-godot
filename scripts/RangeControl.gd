extends HBoxContainer

signal percentage_changed

var currentPercentage = 1.0

func _ready():
	$SubtractButton.connect("pressed", self, "on_button_pressed", [-.1])
	$AddButton.connect("pressed", self, "on_button_pressed", [.1])

func set_current_percentage(percent):
	currentPercentage = clamp(percent, 0, 1)
	var labelnumber = currentPercentage * 10
	labelnumber = round(labelnumber)
	$HBoxContainer/Label.text = str(labelnumber)
	emit_signal("percentage_changed", currentPercentage)

func on_button_pressed(change):
	set_current_percentage(currentPercentage + change)
