extends Button

signal change_displayed
signal change_cur_prof
onready var prof_animated := $Prof4_Animated
# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 3:
		self.visible = false
		prof_animated.visible = false
	else:
		self.text = keys[3]
		if self.text in prof_animated.frames.get_animation_names():
			prof_animated.play(self.text)

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
	emit_signal("change_cur_prof",self.text)
