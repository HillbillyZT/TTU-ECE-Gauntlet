extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var items =[]
var items = {}
signal update
signal used
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in Globals.item_base:
		items[item] = {"name":item,"Quantity":0}


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Confirm_buy(item):
	if items.has(item):
		items[item]["Quantity"] += 1
	else:
		items[item] = {"name":item,"Quantity":1}
	emit_signal("update",self.items)


func _on_Item_Description_used(name):
	items[name]["Quantity"] -= 1
	emit_signal("update",name,self.items)
