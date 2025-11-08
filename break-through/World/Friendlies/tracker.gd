extends RigidBody2D

var track : bool = false
var touched_based : bool = false
var distance : float = 0
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var enemy_base = get_tree().get_nodes_in_group("enemy_base")[0]
@export var speed = 25

func _ready():
	set_contact_monitor(true)
	if player:
		print("player found")
	
func _physics_process(delta):
	if player:
		if track:#if this is set to true
			var direction = (player.global_position - global_position).normalized()#set direction
			distance = player.global_position.distance_to(global_position)#calculate distance
			#print(distance)#print for visibility
			if distance < 100:#check if it is close
				apply_central_force(direction * speed)#move toward direction which is set to the players
			else:
				pass
		if track == false:#if this is false
			if touched_based == false:
				var direction = (enemy_base.global_position - global_position).normalized()#set dietcion to base
				apply_central_force(direction * speed)#move toward the base
			else:
				pass
	else:
		pass
			


func _on_body_entered(body):
	if body.is_in_group("player"):
		print("player contacted")
		touched_based = false
		track = false
	if body.is_in_group("enemy_base"):
		print("mothership contacted")
		touched_based = true
		track = true
	else:
		pass
