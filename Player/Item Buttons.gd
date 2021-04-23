extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
