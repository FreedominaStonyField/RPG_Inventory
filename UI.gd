extends Control

@export var player_inventory:Inventory = Inventory.new()


func _ready():
	
	hide()

func _input(event):
	if event.is_action_pressed("open_inventory"):
		player_inventory.add_item("Hypno Watch", 1)
		player_inventory.add_item("Vibe Wand", 1)
		get_tree().paused = !get_tree().paused
		visible = !visible
