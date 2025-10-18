extends RigidBody2D

@export var move_speed: float = 100
@export var thrust_force: float = 500

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var direction = Vector2.ZERO
	
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
