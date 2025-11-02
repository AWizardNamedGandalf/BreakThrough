extends RigidBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]
@export var speed = 200
func _physics_process(delta):
	if player:
		print("player found")
		var direction = (player.global_position - global_position).normalized()
		apply_central_force(direction * speed)
	else:
		pass
