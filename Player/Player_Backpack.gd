extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var items =[]
var items = {}
signal update
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Confirm_buy(item):
	if items.has(item):
		items[item]["Quantity"] += 1
	else:
		items[item] = {"name":item,"Quantity":1}
	emit_signal("update",item)
