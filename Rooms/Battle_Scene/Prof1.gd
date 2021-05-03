extends Button

signal change_displayed
signal change_cur_prof
export var index = -1
var prof_animated

# Called when the node enters the scene tree for the first time.
func _ready():
	match(index):
		0: prof_animated = $Prof1_Animated
		1: prof_animated = $Prof2_Animated
		2: prof_animated = $Prof3_Animated
		3: prof_animated = $Prof4_Animated
		4: prof_animated = $Prof5_Animated
		5: prof_animated = $Prof6_Animated
		
	
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= index:
		self.visible = false
		prof_animated.visible = false
	else:
		self.text = keys[index]
		if self.text in prof_animated.frames.get_animation_names():
			prof_animated.play(self.text)

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
	emit_signal("change_cur_prof",self.text)
