extends PanelContainer



@onready var player_inventory : Inventory = get_tree().get_first_node_in_group("player").inventory

func _on_inventory_button_toggled(toggled_on):
	if toggled_on == true:
		visible = !visible
		for i in $MarginContainer/VBoxContainer.get_children():
			i.queue_free()
		for i in player_inventory._get_items():
			$MarginContainer/VBoxContainer.add_child(Button.new())
	else:
		hide()
	print(player_inventory._items)
	pass # Replace with function body.
