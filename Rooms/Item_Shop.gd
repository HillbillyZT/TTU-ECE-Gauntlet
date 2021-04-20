extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Too_Far_From_Shop_too_far():
	self.visible = false


func _on_Shop_Open_Shop():
	print("Recieved signal")
	self.visible = true
