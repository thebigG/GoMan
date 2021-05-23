extends Node2D

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
		get_node("StopMan1").set("linear_velocity", Vector2(0,0))	
		get_node("StopMan2").set("linear_velocity", Vector2(0,0))
		get_node("StopMan3").set("linear_velocity", Vector2(0,0))	
		get_node("StopMan1").set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))	
		get_node("StopMan2").set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))	
		get_node("StopMan3").set("position", Vector2(get_tree().get_nodes_in_group("Origin")[1].get("position")))

func restart_stopman():
	move_to_origin()
	get_node("StopMan1").linear_velocity = get_node("StopMan1").get("UP")
	get_node("StopMan2").linear_velocity = get_node("StopMan2").get("UP")
	get_node("StopMan3").linear_velocity = get_node("StopMan3").get("UP")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if set_to_origin:
		restart_stopman()
		set_to_origin = false
	


func _on_Area2D3_body_entered(body):
	print(get_tree().get_nodes_in_group('Enemy')[0].get("UP"))
