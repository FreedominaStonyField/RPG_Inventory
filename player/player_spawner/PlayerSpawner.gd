extends Marker3D

@export var player_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	#Dialogic.start("welcome_game_start")
	var player = player_scene.instantiate()
	player.add_to_group("player")
	add_child(player)
	
	#hide()
