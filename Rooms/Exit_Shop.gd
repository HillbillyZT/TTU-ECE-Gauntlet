extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal closed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	emit_signal("closed")
	var parent = get_node("..")
	parent.visible = !parent.visible
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
