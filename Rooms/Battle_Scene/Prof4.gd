extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var keys = Globals.temp_player_roster.keys()
	if keys.size() <= 3:
		self.visible = false
	else:
		self.text = keys[3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
