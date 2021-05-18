extends Node

var total_food_count = 0
var current_food_count = 0

signal start_game

export(PackedScene) var Level1
var level_handle

onready var Menu  = $Menu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Score.text = "Food:" + str(total_food_count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mouth_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("Food"):
		area.queue_free()
		$FoodSound.play()
		current_food_count += 1

		get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/Score").text =  "Food:" + str(current_food_count)
		if current_food_count == total_food_count:
			$YAY.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	print("Start!")
	level_handle = Level1.instance()
	get_parent().add_child(level_handle)

	print("get_parent:" + str(get_parent()))
	
	total_food_count = get_tree().get_nodes_in_group('Food').size()
	print($Menu.get_node("Score"))
	$Menu.get_node("Score").text =  "Food:" + str(0)
	$Menu.get_node("StartButton").set("visible", false)
	$Menu.get_node("Title").set("visible", false)
#	queue_free()
