extends Node


const prof_base = {
	"gale": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/gale/gale-spritesheet.png"
	},
	"helm": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/helm/helm-spritesheet.png"
	},
	"nikishin": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/nikishin/nikishin-spritesheet.png"
	},
	"nutter": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/nutter/nutter-world.png"
	},
	"sarraf": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/sarraf/sarraf-spritesheet.png"
	}, 
	"stephens":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/stephens/stephens-spritesheet.png"
	},
	"storrs":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/storrs/storrs-spritesheet.png"
	}
}
var prof_current = {}

var prof_battle;

var player_buffered_position = Vector2(794, 569)
var temp_player_roster = ["storrs","stephens","sarraf"]

func _ready():
	pass # Replace with function body.


