extends Node

var total_food_count = 0
var current_food_count = 0

signal start_game

export(PackedScene) var Level100
var life_count = 3

signal enemy_stop

var stop_man_origin_count = 0
export var STOPMAN_COUNT = 3

func lose_1_life():
	
	if life_count <= 0:
		print("Game Over!:" + str(life_count))
		
		#TODO: Delete the current level1, otherwise we get infinite worlds.
		#Wait a minute...It's a feature, NOT a bug!
		game_over()
		
	elif life_count > 0 and !get_tree().get_nodes_in_group("Level1")[0].get_node("StopMen").get("set_to_origin"):
		print(get_tree().get_nodes_in_group("Level1")[0].get_node("StopMen").get("set_to_origin"))
		print("stop_man_origin_count:" + str(stop_man_origin_count))
		var lives = get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/Lives")
		lives.remove_child(lives.get_child(lives.get_child_count()-1))
		$Music.stop()
		get_tree().get_nodes_in_group("Menu")[0].get_node("Dead").play()
	#	reset game
	#	Perhaps have a timeout here??
		get_tree().get_nodes_in_group("Menu")[0].emit_signal("enemy_stop")
		
		$GoMan.set("position", Vector2($GoManOrigin.get("position")))	
		$Music.play()
		life_count = life_count -1
	
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Mouth_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("Food"):
		area.queue_free()
		$FoodSound.play()
		current_food_count += 1

		get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/StartMenu/Score").text =  "Food:" + str(current_food_count)
		if current_food_count == total_food_count:
			$YAY.play()
	if area.is_in_group("Enemy"):
		lose_1_life()


func start_game():
	var level_handle = Level100.instance()
	get_parent().add_child(level_handle)
	
	connect("enemy_stop", level_handle.get_node("StopMen"),  "reset_to_origin")	
	
	total_food_count = get_tree().get_nodes_in_group('Food').size()
	
	total_food_count = get_tree().get_nodes_in_group('Food').size()
	$Menu/StartMenu.get_node("Score").text =  "Food:" + str(0)
	$Menu/StartMenu.get_node("StartButton").set("visible", false)
	$Menu/StartMenu.get_node("Title").set("visible", false)

func _on_StartButton_pressed():
	print('Start Button Pressed')
	start_game()

func game_over():
	print("GameOver1")
	get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/StartMenu").queue_free()
	queue_free()
	get_tree().get_nodes_in_group("Menu")[0].get_node("Menu/GameOverMenu").set("visible", true)
	print("Game over2")

func restart_game():
	queue_free()
	get_tree().reload_current_scene()


func _on_TryAgainButton_pressed():
	restart_game()
