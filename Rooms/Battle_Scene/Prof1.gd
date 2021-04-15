extends Button

onready var keys = Globals.temp_player_roster.keys()
signal change_displayed
# Called when the node enters the scene tree for the first time.
func _ready():
	if keys.size() <= 0:
		print("um... This shouldn't be possible...")
		self.visible = false
	else:
		self.text = keys[0]

func _pressed():
	emit_signal("change_displayed",Globals.prof_current[self.text]["sprite"])
