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

var temp_player_roster = prof_base
var player_buffered_position = Vector2(794, 569)

func _ready():
	pass # Replace with function body.


