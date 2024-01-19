extends Area3D
class_name  InteractableArea

@export var action_name: String = "Interact"

var interact: Callable = func():
	pass


func _on_body_entered(body):
	InteractionManager.register_area(self)
	pass # Replace with function body.


func _on_body_exited(body):
	InteractionManager.unregister_area(self)
	pass # Replace with function body.
