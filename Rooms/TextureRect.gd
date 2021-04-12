extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var me = get_node(".")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Item_0_show(name,cost):
	self.visible = true
	var children = me.get_children()
	for child in children:
		if child.name == "Item Description":
			child.text = """This is a {name}. It costs {cost} dogecoin. 
			
			Are you sure you want to buy this?""".format({"name":name,"cost":cost})

func _on_Item_1_show(name,cost):
	self.visible = true
	var children = me.get_children()
	for child in children:
		if child.name == "Item Description":
			child.text = """This is a {name}. It costs {cost} dogecoin. 
			
			Are you sure you want to buy this?""".format({"name":name,"cost":cost})


func _on_Item_2_show(name,cost):
	self.visible = true
	var children = me.get_children()
	for child in children:
		if child.name == "Item Description":
			child.text = """This is a {name}. It costs {cost} dogecoin. 
			
			Are you sure you want to buy this?""".format({"name":name,"cost":cost})
