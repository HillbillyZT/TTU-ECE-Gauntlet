extends Button

signal change_displayed
signal change_cur_prof
onready var prof_animated := $Prof6_Animated
# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 5:
		self.visible = false
		prof_animated.visible = false
	else:
		self.text = keys[5]
		prof_animated.play(self.text)

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
	emit_signal("change_cur_prof",self.text)

