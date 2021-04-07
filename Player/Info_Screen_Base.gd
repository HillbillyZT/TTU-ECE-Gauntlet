extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var node = get_node(".")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Roster_Open_Roster():
	"""
	var children = node.get_children()
	for child in children:
		child.visible = !child.visible
	node.visible = !node.visible
	"""
	node.visible = !node.visible


func _on_Back_back_button_pressed():
	"""
	node.visible = !node.visible
	var children = node.get_children()
	for child in children:
		child.visible = !child.visible
	"""
	node.visible = !node.visible
	
		


func _on_Items_items():
	"""
	var children = node.get_children()
	for child in children:
		child.visible = !child.visible
	"""
	node.visible = !node.visible
