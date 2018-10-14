extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$VBoxContainer2/TotalMoney.text = "Total money: " + str(stepify(GameManager.total_money, 0.01)) + " $"
	pass
