extends Control

func _on_back_pressed():
	# Transitioning back to main menu
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
