extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal Prof2_Pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() > 1:
		self.text = keys[1]
	else:
		self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _pressed():
	emit_signal("Prof2_Pressed")
