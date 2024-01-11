extends CharacterBody3D

var inventory : Inventory = Inventory.new()

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction:Vector3 = Vector3.ZERO
@onready var animation_tree :AnimationTree = $Visuals/AnimationTree


@warning_ignore("unused_parameter")
func _process(delta):
	update_animation_peramiters()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#print(direction)
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#var last_movement_direction:Vector2
	

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	


func update_animation_peramiters():
	var walking_direction = Vector2(direction.x, direction.z)
	if (velocity != Vector3.ZERO):
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	else:
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
		
	if(direction != Vector3.ZERO):
		animation_tree["parameters/Idle_BlendSpace2D/blend_position"] = walking_direction
		animation_tree["parameters/Walking_BlendSpace2D/blend_position"] = walking_direction
		
	
