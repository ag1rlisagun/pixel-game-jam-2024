extends Node2D

@export var inv: Inv
@export var fish_inv: Inv
@export var decor_inv: Inv

var player_save = "res://SaveData/little_oannes_play_inv.tres"
var fish_save = "res://SaveData/little_oannes_fish_inv.tres"
var decor_save = "res://SaveData/little_oannes_decor_iinv.tres"
	
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

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/main_boat_scene.tscn")

func _on_save_button_pressed():
	save()
