extends RigidBody3D

@export var ItemName : StringName

@onready var interaction_area = $InteractionArea



func _ready():
	interaction_area.interact = Callable(self,"_on_interact")



func _on_interact():
	InteractionManager.player.inventory.add_item(ItemName, 1)
	queue_free()
	pass

