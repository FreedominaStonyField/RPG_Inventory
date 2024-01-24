extends PanelContainer

@onready var bag_slots = $MarginContainer/VBoxContainer
@onready var player_inventory : Inventory = $"../..".inventory
var inventory_button_group = ButtonGroup.new()


func _ready():
	if player_inventory:
		player_inventory.inventory_changed.connect(_update_ui)


func _update_ui(bag):
	for slot in bag_slots.get_children():
		slot.queue_free()
		
	for i in bag._get_items():
		var new_bag_slot = Button.new()
		new_bag_slot.text = i.item_reference.item_name + "   x" + str(i.quantity)
		
		new_bag_slot.button_group = inventory_button_group
		bag_slots.add_child(new_bag_slot)
		print(i.quantity) 
		
	pass
func _on_inventory_button_toggled(toggled_on):
	if toggled_on == true:
		visible = true
		if bag_slots.get_children().size() > 0:
			bag_slots.get_child(0).grab_focus()
		#for i in $MarginContainer/VBoxContainer.get_children():
			#i.queue_free()
		#for i in InteractionManager.player.inventory._get_items():
			#var button = Button.new()
	#
			#$MarginContainer/VBoxContainer.add_child(Button.new())
			#button.text = i.item_reference.item_name #+ "   x" + String(i.quantity) 
			#button.button_group = inventory_button_group
	else:
		hide()
	#print(InteractionManager.player.inventory._items)
	pass # Replace with function body.
