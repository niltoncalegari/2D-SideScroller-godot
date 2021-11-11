extends CanvasLayer

signal back_pressed

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/WindowMode/WindowModeButton
onready var musicRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/MusicVolume/RangeControl
onready var sfxRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolume/RangeControl

var fullScreen = false

func _ready():
	backButton.connect("pressed", self, "on_back_entered")
	windowModeButton.connect("pressed", self, "on_window_mode_entered")
	musicRangeControl.connect("percentage_changed", self, "on_musica_volume_changed")
	sfxRangeControl.connect("percentage_changed", self, "on_sfx_volume_changed")
	update_diplay()
	update_initial_volume_settings()

func update_diplay():
	windowModeButton.text = "WINDOWED" if !fullScreen else "FULLSCREEN"
	
func on_back_entered():
	emit_signal("back_pressed")

func on_window_mode_entered():
	fullScreen = !fullScreen
	OS.window_fullscreen = fullScreen
	update_diplay()

func update_bus_volume(percent, busIndexName):
	var busIdx = AudioServer.get_bus_index(busIndexName)
	var volumeDb = linear2db(percent)
	AudioServer.set_bus_volume_db(busIdx, volumeDb)
	
func on_musica_volume_changed(percent):
	update_bus_volume(percent, "Music")
	
func on_sfx_volume_changed(percent):
	update_bus_volume(percent, "SFX")

func get_bus_volume_percent(busIndexName):
	var busIdx = AudioServer.get_bus_index(busIndexName)
	var volumePercent = db2linear(AudioServer.get_bus_volume_db(busIdx))
	return volumePercent
	
func update_initial_volume_settings():
	var musicPercent = get_bus_volume_percent("Music")
	musicRangeControl.set_current_percentage(musicPercent)
	
	var sfxPercent = get_bus_volume_percent("SFX")
	sfxRangeControl.set_current_percentage(sfxPercent)
