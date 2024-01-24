extends Area3D
class_name area_interaction

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_tree().get_first_node_in_group("player"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.is_in_group("player")):
		
		body.inventory.add_item("$", 3)
		body.inventory.add_item("Hypno Watch", 3)
	pass # Replace with function body.
