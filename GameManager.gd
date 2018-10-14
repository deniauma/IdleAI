extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var total_money = 0.0
var money_per_sec = 1.0
var process_power = 0.0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	total_money += money_per_sec * delta
	pass
