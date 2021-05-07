extends RigidBody2D

export (Vector2) var UP
export (Vector2) var DOWN
export (Vector2) var LEFT
export (Vector2) var RIGHT

var first_time = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = UP

	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print('global position for stopman' + str(get_node("CollisionShape2D").get_global_transform_with_canvas()))
	#print("$$$global position$$$:"+ str(global_position))
	pass


func _on_Area2D3_body_entered(body):
	print(get_tree().get_nodes_in_group('Enemy')[0].get("UP"))
	pass # Replace with function body.
