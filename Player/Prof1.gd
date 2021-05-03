extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal Prof_Pressed
onready var parent = get_node("..")
# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if(keys.size() == 0): return
	else:
		self.text = keys[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	if parent.name == "Professor Buttons":
		emit_signal("Prof_Pressed",self.text)
	else:
		emit_signal("Prof_Pressed")
	
