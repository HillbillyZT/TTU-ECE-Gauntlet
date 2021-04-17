extends Button

signal change_displayed
signal change_cur_prof
# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 3:
		self.visible = false
	else:
		self.text = keys[3]

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
	emit_signal("change_cur_prof",self.text)
