extends RigidBody2D

export (Vector2) var UP
export (Vector2) var DOWN
export (Vector2) var LEFT
export (Vector2) var RIGHT

var set_to_origin = false

# Called when the node enters the scene tree for the first time.
func _ready():
	restart_stopman()
	randomize()


func reset_to_origin():
	set_to_origin = true

func move_to_origin():
		set("linear_velocity", Vector2(0,0))	
		set("linear_velocity", Vector2(0,0))
		set("linear_velocity", Vector2(0,0))	
		set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))	
		set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))	
		set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))

func restart_stopman():
	move_to_origin()
	linear_velocity = UP

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if set_to_origin:
		restart_stopman()
		set_to_origin = false
	


func _on_Area2D3_body_entered(body):
	print(get_tree().get_nodes_in_group('Enemy')[0].get("UP"))
	pass # Replace with function body.
