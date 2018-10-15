extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var skill_to_unlock = 1
export var money_per_sec = 5
export var unlocked = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.hide()
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if GameManager.skills.has(skill_to_unlock):
		self.show()
	pass
