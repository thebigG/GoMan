extends Node

var total_food_count = 0
var current_food_count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set("visible", false)
	print('ready...')
	total_food_count = get_tree().get_nodes_in_group('Food').size()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mouth_area_shape_entered(area_id, area, area_shape, self_shape):
	print("_on_Mouth_area_shape_entered000000")
	if area.is_in_group("Food"):
		area.queue_free()
		$FoodSound.play()
		current_food_count += 1
		if current_food_count == total_food_count:
			$YAY.play()
		


func _on_Menu_start_game():
	print('Start!')
