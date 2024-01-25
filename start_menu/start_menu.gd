extends Control

@export var new_game_scene : PackedScene 
@export var player : PackedScene

func _ready():
	$ColorRect/VBoxContainer/NewGameButton.grab_focus()

func _on_new_game_button_pressed():
	$"../GameWorld/Level".add_child(new_game_scene.instantiate())
	var player_instance = player.instantiate()
	$"../GameWorld/Player".add_child(player_instance)
	
	queue_free()
	# Start Game
	#$".".add_child(new_game_scene.instantiate())
	#queue_free()
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
