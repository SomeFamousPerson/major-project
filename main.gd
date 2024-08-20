extends Control

@onready var mainmenu = $"main menu"
@onready var instructions = $instructions

func _ready():
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://levels/level_1.tscn")


func _on_instructions_pressed():
	instructions.visible = true
	mainmenu.visible = false


func _on_back_pressed():
	instructions.visible = false
	mainmenu.visible = true	
