extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var node = get_node("..")
	node = node.get_parent()
	items_on_hand = node.items


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var items_on_hand

func _on_Player_Backpack_update(items):
	for child in self.get_children():
		if items.has(child.text):
			child.visible = true
		else:
			child.visible = false
	items_on_hand = items
