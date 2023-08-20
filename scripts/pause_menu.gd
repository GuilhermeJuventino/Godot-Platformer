extends Control


# Called when the node enters the scene tree for the first time.
"""func _ready():
	$CanvasLayer/MarginContainer/PauseMenuButtons/Resume.grab_focus()"""

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		$CanvasLayer.visible = new_pause_state
		
		if new_pause_state:
			$CanvasLayer/MarginContainer/PauseMenuButtons/Resume.grab_focus()

func _on_resume_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	$CanvasLayer.visible = new_pause_state

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()
