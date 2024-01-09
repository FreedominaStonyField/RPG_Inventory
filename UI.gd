extends Control

@export var player_inventory:Inventory = Inventory.new()

@onready var item_selection_list = $ScrollContainer/MarginContainer/ItemList

func _ready():
	player_inventory.connect('inventory_changed', update_ui)
	hide()

func _input(event):
	if event.is_action_pressed("open_inventory"):

		get_tree().paused = !get_tree().paused
		visible = !visible

	elif event.is_action_pressed("ui_up"):
		player_inventory.add_item("Hypno Watch", 1)
		player_inventory.add_item("Vibe Wand", 1)

	elif event.is_action_pressed("ui_cancel"):

		player_inventory.remove_item("Vibe Wand")
		player_inventory.remove_item("VibeWand")
func update_ui(inventory):
	
	for i in item_selection_list.get_children():
		i.queue_free()
	for i in inventory._items:
		var item_label = Button.new()
		item_label.toggle_mode = true
		item_label.text = "{} x{}".format([i.item_reference.item_name, i.quantity], "{}")
		

		item_selection_list.add_child(item_label)
