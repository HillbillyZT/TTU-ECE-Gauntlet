extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var node = get_node(".")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Roster_Open_Roster():
	node.visible = !node.visible


func _on_Back_back_button_pressed():
	node.visible = !node.visible
	
		


func _on_Items_items():
	node.visible = !node.visible
