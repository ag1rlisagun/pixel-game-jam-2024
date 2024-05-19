extends Node2D

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/main_boat_scene.tscn")

# use generated random numbers to change the probability of certain 
# fish and items showing up and where they show up

# create the fish and collectibles here in the script

func _on_timer_timeout():
	# add text about oxygen levels!
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/main_boat_scene.tscn")
