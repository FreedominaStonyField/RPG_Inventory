extends PanelContainer


var inventory_button_group = ButtonGroup.new()


func _on_inventory_button_toggled(toggled_on):
	if toggled_on == true:
		visible = !visible
		for i in $MarginContainer/VBoxContainer.get_children():
			i.queue_free()
		for i in InteractionManager.player.inventory._get_items():
			var button = Button.new()
	
			$MarginContainer/VBoxContainer.add_child(Button.new())
			button.text = i.item_reference.item_name #+ "   x" + String(i.quantity) 
			button.button_group = inventory_button_group
	else:
		hide()
	#print(InteractionManager.player.inventory._items)
	pass # Replace with function body.
