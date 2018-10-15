extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var skill_id = 1
export var cp_to_unlock = 10
export var cp_to_learn = 100
var cp_learnt = 0
var learned = false
var learning = false

func on_button_pressed():
	if not learning:
		learning = true
	pass

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.hide()
	$ProgressBar.visible = false
	$ProgressBar.value = 0
	$ProgressBar.max_value = cp_to_learn
	self.connect("pressed", self, "on_button_pressed")
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if GameManager.process_power >= cp_to_unlock:
		self.show()
	if learning:
		$ProgressBar.show()
		cp_learnt += GameManager.process_power * delta
		$ProgressBar.value = cp_learnt
		if cp_learnt >= cp_to_learn:
			learned = true
			learning = false
			GameManager.skills.append(skill_id)
	else:
		$ProgressBar.hide()
	pass
