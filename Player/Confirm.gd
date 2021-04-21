extends Button

# Called when the node enters the scene tree for the first time.
signal buy
func _ready():
	pass # Replace with function body.

func _pressed():
	var node = get_node("..")
	node = node.get_parent()
	emit_signal("buy",node.current_item_sel)
	Globals.player_items.append(Globals.item_base.get(node.current_item_sel))

