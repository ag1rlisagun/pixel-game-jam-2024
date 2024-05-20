extends Node2D

@export var fish_inv: Inv
@export var decor_inv: Inv

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/main_boat_scene.tscn")
