extends Control

#func _on_new_game_button_pressed():
#	pass 

#func _on_continue_button_pressed():
#	pass 

func _on_play_button_pressed(): # here until there's a save system
	get_tree().change_scene_to_file("res://Scenes/Game Scenes/main_boat_scene.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Non-Play Scenes/options_scene.tscn")

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Non-Play Scenes/credits_scene.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
