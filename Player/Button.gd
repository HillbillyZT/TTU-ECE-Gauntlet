extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal update
# Called when the node enters the scene tree for the first time.
func _ready():
	if self.name == "Button":
		self.text = "Multimeter"
	elif self.name == "Button2":
		self.text = "Soldering Iron"
	else:
		self.text = "TI-84"
		
func _pressed():
	var parent = get_node("..")
	print(parent.name)
	emit_signal("update",self.text,parent.items_on_hand)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
