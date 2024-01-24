extends Area3D
class_name area_interaction

@export var Pickup_item : StringName
@export var pickup_ammount : int = 1

var can_interact = false
var user

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#print(get_tree().get_first_node_in_group("player"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_interact and Input.is_action_just_pressed("interact"):
		user.inventory.add_item(Pickup_item, pickup_ammount)
	pass


func _on_body_entered(body):
	if(body.is_in_group("player")):
		user = body
		can_interact = true

		
	pass # Replace with function body.


func _on_body_exited(body):
	if(body.is_in_group("player")):
		can_interact = false
		user = null
	pass # Replace with function body.
