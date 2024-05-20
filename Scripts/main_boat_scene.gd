extends Node2D

@onready var fish_tank_text = $FishTankPrompt
@onready var diving_text = $DivingPrompt
@onready var menu_prompt = $MarginContainer

@export var inv: Inv
@export var fish_inv: Inv
@export var decor_inv: Inv

var player_save = "res://SaveData/little_oannes_play_inv.tres"
var fish_save = "res://SaveData/little_oannes_fish_inv.tres"
var decor_save = "res://SaveData/little_oannes_decor_inv.tres"
	
func save():
	ResourceSaver.save(inv, player_save)
	ResourceSaver.save(fish_inv, fish_save)
	ResourceSaver.save(decor_inv, decor_save)
	print("Saved!")
	
func load_data():
	if FileAccess.file_exists(player_save):
		inv = load("res://SaveData/little_oannes_play_inv.tres")
	if FileAccess.file_exists(fish_save):
		fish_inv = load("res://SaveData/little_oannes_fish_inv.tres")
	if FileAccess.file_exists(decor_save):
		decor_inv = load("res://SaveData/little_oannes_decor_inv.tres")

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
	# save here!!!!
	save()
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/start_screen.tscn")

func _on_stay_here_button_pressed():
	menu_prompt.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		menu_prompt.visible = true

func _on_save_button_pressed():
	save()
