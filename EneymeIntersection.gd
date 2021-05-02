extends Area2D

export(int, "ENABLED", "DISABLED") var UP
export(int, "ENABLED", "DISABLED") var DOWN
export(int, "ENABLED", "DISABLED") var LEFT
export(int, "ENABLED", "DISABLED") var RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_direction_path():
	# NOTE: Maybe I should return vectors here. instead of strings..
	var options = Array()
	if UP == 0:
		options.append('UP')
	if DOWN == 0:
		options.append('DOWN')
	if LEFT == 0:
		options.append('LEFT')
	if RIGHT == 0:
		options.append('RIGHT')
		
	var option_index  = randi() % options.size()
	return options[option_index]

func _on_Area2D3_body_entered(body):
	#body.liner_velocity = get_tree().get_nodes_in_group('Enemy')
	var direction  = get_direction_path()
	print(direction)
