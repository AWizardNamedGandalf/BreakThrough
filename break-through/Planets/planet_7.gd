extends RigidBody2D
var rotation_number = randi_range(-700, 700)
var velocity_number1 = randi_range(-70, 70)
var velocity_number2 = randi_range(-70, 70)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_torque_impulse(rotation_number)
	apply_central_impulse(Vector2(velocity_number1,velocity_number2))
