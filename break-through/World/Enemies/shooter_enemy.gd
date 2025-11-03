extends RigidBody2D

var track : bool = true
@onready var player = get_tree().get_nodes_in_group("player")[0]
@export var speed = 200

func _ready():
	set_contact_monitor(true)
	if player:
		print("player found")
	
func _physics_process(delta):
	if player:
		if track:
			var direction = (player.global_position - global_position).normalized()
			apply_central_force(direction * speed)
	else:
		pass


func _on_body_entered(body):
	print("contact", body.name)
	pass # Replace with function body.
