extends Control

@export var new_game_scene : PackedScene 

func _ready():
	$ColorRect/VBoxContainer/NewGameButton.grab_focus()

func _on_new_game_button_pressed():
	# Start Game
	get_tree().change_scene_to_packed(new_game_scene)
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
