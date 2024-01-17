extends PanelContainer


#var inventory_button_group = ButtonGroup.new()
#@onready var player_inventory : Inventory = InteractionManager.player.inventory
#
#func _on_inventory_button_toggled(toggled_on):
	#if toggled_on == true:
		#visible = !visible
		#for i in $MarginContainer/VBoxContainer.get_children():
			#i.queue_free()
		#for i in player_inventory._get_items():
			#var button = Button.new()
			#button.text = i.item_reference.item_name + "   " + i.quantity
			#button.button_group = inventory_button_group
			#$MarginContainer/VBoxContainer.add_child(Button.new())
	#else:
		#hide()
	#print(player_inventory._items)
	#pass # Replace with function body.
