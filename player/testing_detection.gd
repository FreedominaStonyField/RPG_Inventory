extends VBoxContainer


# Called when the node enters the scene tree for the first time.
var list_of_interactables:Array = []

func _on_area_3d_body_entered(body):
	list_of_interactables.append(body)
	reload_item_list()
	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	list_of_interactables.erase(body)
	reload_item_list()
	pass # Replace with function body.

func reload_item_list():
	for i in get_children():
		i.queue_free()
	for item in list_of_interactables:
		var item_entry = Label.new()
		item_entry.text = item.name
		add_child(item_entry)
