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
		
func get_CP():
	return level * cp_per_level

func on_button_pressed():
	if GameManager.total_money >= next_price():
		GameManager.total_money -= next_price()
		level += 1
	pass

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("Idle_CP_buttons")
	$IdleButton.disabled = true
	$IdleButton.connect("pressed", self, "on_button_pressed")
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$MarginContainer/VBoxContainer/Label.text = "Price: " + str(round(next_price()))
	$MarginContainer/VBoxContainer/Label2.text = "Level " + str(level)
	if GameManager.total_money >= next_price():
		$IdleButton.disabled = false
		$MarginContainer.modulate.a = 1.0
	else:
		$IdleButton.disabled = true
		$MarginContainer.modulate.a = 0.5
	pass
