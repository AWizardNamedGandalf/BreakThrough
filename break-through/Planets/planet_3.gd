extends RigidBody2D
var rotation_number = randi_range(-300, 300)
var velocity_number1 = randi_range(-30, 30)
var velocity_number2 = randi_range(-30, 30)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_torque_impulse(rotation_number)
	apply_central_impulse(Vector2(velocity_number1,velocity_number2))
