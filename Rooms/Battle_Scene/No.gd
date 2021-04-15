extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	var root = get_node("..").get_parent()
	for child in root.get_children():
		if child.name == "Drop Set":
			child.visible = false
		if child.name == "Main Buttons":
			child.visible = true
