extends Node


var items : Array
func _ready():
	load_items_into_array()
	print("the following items have been loaded into the database:" )
	for i in items:
		print(i.item_name)


func load_items_into_array():
	var dir = DirAccess.open("res://auto_loads/ItemDatabase/Items/")
	dir.list_dir_begin()
	
	var filename = dir.get_next()
	while(filename):
		if !dir.current_is_dir():
			items.append((load("res://auto_loads/ItemDatabase/Items/%s" % filename)))
			
		filename = dir.get_next()


func get_item(item_name):
	
	for i in items:
		if i.item_name == item_name:
			return i
		else:
			print(item_name + " not found in databese")
