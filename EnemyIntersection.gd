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
	var who_is_it = Array()
	for enemy in get_tree().get_nodes_in_group('Enemy'):
		if  global_position.floor() == enemy.global_position.floor():
			who_is_it.append(enemy)
			
	return who_is_it

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	
	for enemy in is_enemy_here():
		var direction  = get_direction_path()
		#get_tree().get_nodes_in_group('Enemy')[0].set("global_position", global_position)
		enemy.set("linear_velocity", direction)
		
	


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
