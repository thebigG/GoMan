extends Area2D

export(int, "ENABLED", "DISABLED") var UP
export(int, "ENABLED", "DISABLED") var DOWN
export(int, "ENABLED", "DISABLED") var LEFT
export(int, "ENABLED", "DISABLED") var RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	# New random seed
	randomize()

func is_enemy_here():
	return global_position == get_tree().get_nodes_in_group('Enemy')[0].global_position.floor()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if is_enemy_here():
		var direction  = get_direction_path()
		get_tree().get_nodes_in_group('Enemy')[0].set("linear_velocity", direction)
		
	


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
