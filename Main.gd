extends Node

var total_food_count = 0
var current_food_count = 0

signal start_game

export(PackedScene) var Level1
var level_handle
var life_count = 3

signal enemy_stop

func lose_1_life():
	# Handle case when StopMan collides with multiple stopmen at the same time
	# GoMan should still only lose 1 life, if it comes in contact with more than 1 enemy
	if life_count > 0:
		var lives = get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/Lives")
		lives.remove_child(lives.get_child(lives.get_child_count()-1))
		$Music.stop()
		get_tree().get_nodes_in_group("Menu")[0].get_node("Dead").play()
	#	reset game
	#	Perhaps have a timeout here??

		get_tree().get_nodes_in_group("Menu")[0].emit_signal("enemy_stop")

		$GoMan.set("position", Vector2($GoManOrigin.get("position")))	
		$Music.play()
	else:
		print("Game Over!")
		
	life_count = life_count -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Score.text = "Food:" + str(total_food_count)


func _on_Mouth_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("Food"):
		area.queue_free()
		$FoodSound.play()
		current_food_count += 1

		get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/Score").text =  "Food:" + str(current_food_count)
		if current_food_count == total_food_count:
			$YAY.play()
	if area.is_in_group("Enemy"):
		lose_1_life()
		
func _on_Button_pressed():
	level_handle = Level1.instance()
	get_parent().add_child(level_handle)
	
	connect("enemy_stop", level_handle.get_node("StopMan"),  "reset_to_origin")	
	connect("enemy_stop", level_handle.get_node("StopMan2"),  "reset_to_origin")	
	connect("enemy_stop", level_handle.get_node("StopMan3"),  "reset_to_origin")	
	
	total_food_count = get_tree().get_nodes_in_group('Food').size()
	$Menu.get_node("Score").text =  "Food:" + str(0)
	$Menu.get_node("StartButton").set("visible", false)
	$Menu.get_node("Title").set("visible", false)

