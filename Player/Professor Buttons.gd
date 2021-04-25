extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in self.get_children():
		child.visible = false

func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Item_Description_update(quantity):
	if quantity == 0:
		for child in self.get_children():
			child.visible = true
			child.disabled = true
	else:
		for child in self.get_children():
			child.visible = true
			child.disabled = false
