extends Button

signal change_displayed
signal change_cur_prof
onready var prof_animated := $Prof1_Animated

# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 0:
		print("um... This shouldn't be possible...")
		self.visible = false
		prof_animated.visible = false
	else:
		self.text = keys[0]
		prof_animated.play(self.text)

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
	emit_signal("change_cur_prof",self.text)
