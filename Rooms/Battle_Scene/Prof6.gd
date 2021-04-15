extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_displayed

# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 5:
		self.visible = false
	else:
		self.text = keys[5]

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
