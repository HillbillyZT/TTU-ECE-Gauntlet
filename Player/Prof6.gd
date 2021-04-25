extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal Prof6_Pressed
onready var parent = get_node("..")
# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() > 5:
		self.text = keys[5]
	else:
		self.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	if parent.name == "Professor Buttons":
		emit_signal("Prof6_Pressed",self.text)
	else:
		emit_signal("Prof6_Pressed")
