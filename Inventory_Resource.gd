extends Resource
class_name Inventory

@export var _items:Array = Array():set = _set_items, get = _get_items

signal  inventory_changed

func _set_items(new_items:Array):
	_items = new_items
	inventory_changed.emit(self)

func _get_items():
	return _items

func get_item(index:int):
	return _items[index]

func add_item(item_name, amount_to_add):
	if amount_to_add <= 0:
		return
	var item :game_item = ItemDatabase.get_item(item_name)
	
	if not item:
		return

	var amount_left_to_add = amount_to_add
	var max_stack_size = item.max_stack_size if item.stackable else 1
	
	if item.stackable:
		for i in range(_items.size()):
			if amount_left_to_add == 0:
				break
			var inventory_item = _items[i]
			
			if inventory_item.item_reference.item_name != item.item_name:
				continue
				
			if inventory_item.quantity < max_stack_size:
				var original_quantity = inventory_item.quantity
				inventory_item.quantity = min(original_quantity + amount_left_to_add, max_stack_size)
				amount_left_to_add -= inventory_item.quantity - original_quantity


	while amount_left_to_add > 0:
		var new_item = {
			item_reference = item, 
			quantity = min(amount_left_to_add, max_stack_size)
		}
		_items.append(new_item)
		amount_left_to_add -= new_item.quantity
	inventory_changed.emit(self)


func remove_item(item_name):
	for i in _items:
		#print(i)
		print(i.item_reference.item_name)
		if i.item_reference.item_name == item_name:
			print(i.item_reference.item_name)
			i.quantity -= 1
			if i.quantity < 1:
				_items.erase(i)
	inventory_changed.emit(self)
