extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture_normal = load(Globals.player_roster["sarraf"]["sprite"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
