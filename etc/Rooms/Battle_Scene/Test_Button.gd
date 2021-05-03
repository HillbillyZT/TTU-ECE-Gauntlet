extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	var node = get_node(".").get_parent()
	node.visible = false
	node  = node.get_parent()
	for children in node.get_children():
		if children.name == "Move Set":
			node = children
	node.visible = true
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
