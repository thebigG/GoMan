extends Node

var total_food_count = 0
var current_food_count = 0

signal start_game

export(PackedScene) var Level1
var level_handle


func lose_1_life():
	var lives = get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/Lives")
	lives.remove_child(lives.get_child(lives.get_child_count()-1))
	$Music.stop()
	get_tree().get_nodes_in_group("Menu")[0].get_node("Dead").play()
#	reset game
#	Perhaps have a timeout here??
	# For some reason the position of StopMan nodes is not working...
	$StopMan.set("position", Vector2($StopManOrigin.get("position")))	
	$StopMan2.set("position", Vector2($StopManOrigin.get("position")))	
	$StopMan3.set("position", Vector2($StopManOrigin.get("position")))	
	$GoMan.set("position", Vector2($GoManOrigin.get("position")))	
	$Music.play()
	
	


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
	else:
		print("ELSE")
	if area.is_in_group("Enemy"):
		print("Enemy")
		lose_1_life()
	
	
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
