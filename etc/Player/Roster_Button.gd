extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal Open_Roster

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _pressed():
	emit_signal("Open_Roster")
	var node = get_node(".").get_parent()
	node.visible = !node.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
