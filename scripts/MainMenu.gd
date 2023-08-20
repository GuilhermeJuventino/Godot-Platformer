extends Control


func _on_play_pressed():
	# Transitioning to in-game scene
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_pressed():
	# Exiting the game
	get_tree().quit()
