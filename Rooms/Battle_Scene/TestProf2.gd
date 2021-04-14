extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture_normal = load(Globals.prof_current[Globals.temp_player_roster[1]]["sprite"])
	self.texture_hover = load(Globals.prof_current[Globals.temp_player_roster[2]]["sprite"])
	self.texture_pressed = load(Globals.prof_current[Globals.temp_player_roster[0]]["sprite"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
