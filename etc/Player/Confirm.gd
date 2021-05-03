extends Button

# Called when the node enters the scene tree for the first time.
signal buy
func _ready():
	pass # Replace with function body.

func _pressed():
	var node = get_node("..")
	node = node.get_parent()
	if(Globals.doge >= 15):
		Globals.doge -= 15
		emit_signal("buy",node.current_item_sel)

