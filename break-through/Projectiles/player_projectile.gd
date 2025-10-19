extends RigidBody2D

func _ready() -> void:
	var impulse_strength = 100
	var angle = rotation
	apply_central_impulse(Vector2(cos(angle), sin(angle)) * impulse_strength)
	
