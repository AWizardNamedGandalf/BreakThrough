extends RigidBody2D
var impulse = Vector2(100,0)

func _ready() -> void:
	apply_central_impulse(impulse)
	print("I'm Alive!!")
