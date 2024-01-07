extends Control

@export var player_inventory:Inventory


func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("open_inventory"):
		get_tree().paused = !get_tree().paused
		visible = !visible
