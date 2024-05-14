extends Node2D

@onready var fish_tank_text = $FishTankPrompt
@onready var diving_text = $DivingPrompt
@onready var menu_prompt = $MarginContainer

func _on_fish_tank_button_pressed(): # check the fish tank
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/fish_tank_scene.tscn")

func _on_fish_tank_button_mouse_entered(): # show fish tank prompt
	fish_tank_text.visible = true

func _on_fish_tank_button_mouse_exited(): # hide fish tank prompt
	fish_tank_text.visible = false

func _on_dive_button_pressed(): # go diving
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/diving_scene.tscn")

func _on_dive_button_mouse_entered(): # show diving prompt
	diving_text.visible = true

func _on_dive_button_mouse_exited(): # hide diving prompt
	diving_text.visible = false

func _on_back_to_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/start_screen.tscn")

func _on_stay_here_button_pressed():
	menu_prompt.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		menu_prompt.visible = true

