extends Area2D

export(int, "ENABLED", "DISABLED") var UP
export(int, "ENABLED", "DISABLED") var DOWN
export(int, "ENABLED", "DISABLED") var LEFT
export(int, "ENABLED", "DISABLED") var RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print('global position' + str(get_global_transform_with_canvas()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_direction_path():
	var options = Array()
	if UP == 0:
		options.append( get_tree().get_nodes_in_group('Enemy')[0].get('UP'))
	if DOWN == 0:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('DOWN'))
	if LEFT == 0:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('LEFT'))
	if RIGHT == 0:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('RIGHT'))
		
	var option_index  = randi() % options.size()
	return options[option_index]

func _on_Area2D3_body_entered(body):
	var direction  = get_direction_path()
	get_tree().get_nodes_in_group('Enemy')[0].set("linear_velocity", direction)
	print(direction)
	print('global position2:' + str(body.get_global_transform_with_canvas()))
