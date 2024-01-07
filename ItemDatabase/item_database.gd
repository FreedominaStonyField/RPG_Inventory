extends Node


var items : Array

func load_items():
	pass

func get_item(item_name):
	
	for i in items:
		if i.item_name == item_name:
			return i
		else:
			print(item_name + " not found in databese")
