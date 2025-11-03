extends RigidBody2D

var track : bool = true
var distance : float = 0
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemy_base = get_tree().get_nodes_in_group("enemy_base")[0]
@export var speed = 200

func _ready():
	set_contact_monitor(true)
	if player:
		print("player found")
	
func _physics_process(delta):
	if player:
		if track:
			var direction = (player.global_position - global_position).normalized()
			distance = player.global_position.distance_to(global_position)
			print(distance)
			if distance < 100:
				apply_central_force(direction * speed)
			else:
				track = false
		if track == false:
			var direction = (enemy_base.global_position - global_position).normalized()
			apply_central_force(direction * speed)
	else:
		pass
			


func _on_body_entered(body):
	if body.is_in_group("player"):
		print("player contacted")
		track = false
	if body.is_in_group("enemy_base"):
		print("mothership contacted")
		track = true
	else:
		pass
