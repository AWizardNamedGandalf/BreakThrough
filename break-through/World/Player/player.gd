extends RigidBody2D

@export var thrust_force: float = 500
@export var turn_speed: float = 5

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction = Vector2.ZERO
	
	#get mouse position
	var mouse_position : Vector2 = get_global_mouse_position()
	
	#get direction to mouse position from whatever this script is attached to
	var direction_to_mouse: Vector2 = global_position.direction_to(mouse_position)
	
	#get angle from whatever this script is attached to using direction_to_mouse variable
	var target_angle: float = direction_to_mouse.angle()
	
	#get the angle difference from the rotation of this object and where it should rotate
	var angle_diff: float = wrapf(target_angle - rotation, -PI, PI)
	# Get input for movemnt
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
		
	state.apply_force(direction * thrust_force)
	state.angular_velocity = angle_diff * turn_speed
