extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var child = self.get_child(0)
	#child.set_position(Vector2(30,-1000))
	#child.rect_global_position = Rect2(0,0,20,20)
	child.add_item("Your Mother :)")
	
func _pressed():
	var child = self.get_child(0)
	child.add_item("click")
	child.popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
