extends Area2D

export(bool) var UP
export(bool) var DOWN
export(bool) var LEFT
export(bool) var RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	# New random seed
	randomize()

func is_enemy_here():
	return global_position.floor() == get_tree().get_nodes_in_group('Enemy')[0].global_position.floor()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if is_enemy_here():
		var direction  = get_direction_path()
		#get_tree().get_nodes_in_group('Enemy')[0].set("global_position", global_position)
		get_tree().get_nodes_in_group('Enemy')[0].set("linear_velocity", direction)
		
	


func get_direction_path():
	var options = Array()
	if UP:
		options.append( get_tree().get_nodes_in_group('Enemy')[0].get('UP'))
	if DOWN:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('DOWN'))
	if LEFT:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('LEFT'))
	if RIGHT:
		options.append(get_tree().get_nodes_in_group('Enemy')[0].get('RIGHT'))
		
	var option_index  = randi() % options.size()
	return options[option_index]
