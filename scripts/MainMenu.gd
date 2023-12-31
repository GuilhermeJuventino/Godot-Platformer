extends Control

func _ready():
	MusicController.play("TitleScreen")
	$MarginContainer/MainMenuButtons/Play.grab_focus()

func _on_play_pressed():
	# Transitioning to in-game scene
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_pressed():
	# Exiting the game
	get_tree().quit()

func _on_credits_pressed():
	# Transitioning to credits screen
	get_tree().change_scene_to_file("res://scenes/credits_screen.tscn")
