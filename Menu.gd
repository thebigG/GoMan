extends CanvasLayer

signal start_game

export(PackedScene) var Level1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	print("Start!")
	get_parent().add_child(Level1.instance())
	print("get_parent:" + str(get_parent()))
	queue_free()
