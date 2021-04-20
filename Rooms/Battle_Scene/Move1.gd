extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# TODO make this reference the previous scene, not OG
# TODO when exiting battle, DELETE PROFESSOR
func _pressed():
	print("you used the {str} move!".format({"str":self.text}))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


