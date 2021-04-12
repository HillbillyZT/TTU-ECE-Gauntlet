extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal name
signal show
onready var Name = self.name
# Called when the node enters the scene tree for the first time.
func _ready():
	
	Name = Name[5]
	emit_signal("name",Name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	emit_signal("show",self.text,"15")

func _on_ECE_Map_return_name(string,index):
	if(int(index) == int(self.name[5])):
		if(self.text == self.name):
			self.text = string
		else:
			pass
