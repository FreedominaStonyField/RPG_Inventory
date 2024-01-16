extends Marker3D

@export var player_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	#Dialogic.start("welcome_game_start")
	add_child(player_scene.instantiate())
	#hide()
