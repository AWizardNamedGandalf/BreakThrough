extends RigidBody2D
var random_number1 = randi_range(-100, 100)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_torque_impulse(random_number1)
	
