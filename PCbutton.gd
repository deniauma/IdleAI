extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var buy_price = 5
export var cp_per_level = 10
export var level = 0

func calc_price_on_level(lvl):
	return buy_price * pow(1.12, lvl)

func next_price():
	if level == 0:
		return buy_price
	else:
		return calc_price_on_level(level+1)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$IdleButton.disabled = true
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$VBoxContainer/Label.text = "Price: " + str(next_price())
	$VBoxContainer/Label2.text = "Level " + str(level)
	if GameManager.total_money >= next_price():
		$IdleButton.disabled = false
	else:
		$IdleButton.disabled = true
	pass
