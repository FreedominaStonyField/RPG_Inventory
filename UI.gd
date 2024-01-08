extends Control

@export var player_inventory:Inventory = Inventory.new()


func _ready():
	player_inventory.connect('inventory_changed', update_ui)
	hide()

func _input(event):
	if event.is_action_pressed("open_inventory"):
		player_inventory.add_item("Hypno Watch", 1)
		player_inventory.add_item("Vibe Wand", 1)
		get_tree().paused = !get_tree().paused
		visible = !visible
		
func update_ui(inventory):
	
	for i in $ScrollContainer/ItemList.get_children():
		i.queue_free()
	for i in inventory._items:
		var item_label = Label.new()
		item_label.text = "{} x{}".format([i.item_reference.item_name, i.quantity], "{}")
		$ScrollContainer/ItemList.add_child(item_label)

