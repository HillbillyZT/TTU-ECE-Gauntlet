extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = load(Globals.temp_player_roster[Globals.temp_player_roster.keys()[0]]["sprite"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
