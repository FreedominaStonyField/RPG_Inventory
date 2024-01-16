extends Node3D


@onready var interaction_area = $InteractionArea



func _ready():
	interaction_area.interact = Callable(self,"_on_interact")



func _on_interact():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("welcome_game_start")
	
	await _on_timeline_ended()
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
