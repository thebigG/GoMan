extends KinematicBody2D

var current_direction = Vector2()
var can_i_move = true

func _physics_process(delta):
	if can_i_move == true:
		if Input.is_action_pressed("ui_right"):
			current_direction.x = 1
			current_direction.y = 0
		
		if Input.is_action_pressed("ui_left"):
			current_direction.x = -1
			current_direction.y = 0
		if Input.is_action_pressed("ui_down"):
			current_direction.y = 1
			current_direction.x = 0
		
		if Input.is_action_pressed("ui_up"):
			current_direction.y = -1
			current_direction.x = 0
		
	
	move_and_collide(current_direction)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
#	print("_on_Area2D_body_entered")
	can_i_move = true

func _on_Area2D_body_exited(body):
	print("_on_Area2D_body_exited")
	can_i_move = true


