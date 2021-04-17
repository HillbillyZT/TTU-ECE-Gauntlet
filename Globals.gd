extends Node


const prof_base = {
	"gale": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/gale/gale-spritesheet.png",
		moves = {
			1:"Gale1",
			2:"Gale2",
			3:"Gale3",
			4:"Gale4"
		}
	},
	"helm": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/helm/helm-spritesheet.png",
		moves = {
			1:"Helm1",
			2:"Helm2",
			3:"Helm3",
			4:"Helm4"
		}
	},
	"nikishin": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/nikishin/nikishin-spritesheet.png",
		moves = {
			1:"nikishin1",
			2:"nikishin2",
			3:"nikishin3",
			4:"nikishin4"
		}
	},
	"nutter": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/nutter/nutter-world.png",
		moves = {
			1:"nutter1",
			2:"nutter2",
			3:"nutter3",
			4:"nutter4"
		}
	},
	"sarraf": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/sarraf/sarraf-spritesheet.png",
		moves = {
			1:"sarraf1",
			2:"sarraf2",
			3:"sarraf3",
			4:"sarraf4"
		}
	}, 
	"stephens":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/stephens/stephens-spritesheet.png",
		moves = {
			1:"stephens1",
			2:"stephens2",
			3:"stephens3",
			4:"stephens4"
		}
	},
	"storrs":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/storrs/storrs-spritesheet.png",
		moves = {
			1:"storrs1",
			2:"storrs2",
			3:"storrs3",
			4:"storrs4"
		}
	}
}
var prof_current = {}

var prof_battle;

var player_buffered_position = Vector2(794, 569)
var temp_player_roster = prof_current

func _ready():
	pass # Replace with function body.


