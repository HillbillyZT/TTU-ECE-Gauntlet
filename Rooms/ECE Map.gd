extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var items = ["Multimeter","Soldering Iron","TI-84"]
signal return_name
signal return_list
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Item_1_name(index):
	emit_signal("return_name",items[int(index)],index)




func _on_Shop_items():
	emit_signal("return_list",self.items)
