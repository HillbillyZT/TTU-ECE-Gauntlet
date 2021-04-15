extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_displayed

# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 4:
		self.visible = false
	else:
		self.text = keys[4]

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])

