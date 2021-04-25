extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal update
var cur_displayed
signal used
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _update(name,items):
	cur_displayed = name
	self.text = """This is a {name}.\nThis is used to boost a professors {attribute} stat.\nYou have x{num} left\nWhich professor would you like to use it on?""".format({"name":name,"attribute":Globals.item_base[name]["Type"],"num":items[name]["Quantity"]})
	emit_signal("update",items[name]["Quantity"])




func _Prof_Pressed(name):
	Globals.temp_player_roster[name][Globals.item_base[cur_displayed]["Type"]] += Globals.item_base[cur_displayed]["Boost"]
	emit_signal("used",cur_displayed)


