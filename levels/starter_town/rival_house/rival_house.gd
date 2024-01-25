extends Node3D


#@onready var interaction_area = $InteractionArea



func _ready():
	#interaction_area.interact = Callable(self,"_on_interact")
	pass


func _on_interact():
	#Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("welcome_game_start")
	#InteractionManager.player.pause = true
