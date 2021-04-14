extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var thing = load(Globals.prof_current[Globals.temp_player_roster[0]]["sprite"])
	var keys = Globals.prof_current.keys()
	self.texture_normal = load(Globals.prof_current[keys[0]]["sprite"])
	self.texture_hover = load(Globals.prof_current[keys[1]]["sprite"])
	self.texture_pressed = load(Globals.prof_current[keys[2]]["sprite"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
