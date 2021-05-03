extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	var parent = get_node("..")
	parent.visible = !parent.visible
	var children = parent.get_parent().get_children()
	for child in children:
		if child.name == "Menu":
			child.visible = !child.visible
