extends Node


const prof_base = {
	"gale": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/gale/gale-spritesheet.png",
		moves = {
			1:"Ventilate",
			2:"Recruitment",
			3:"Integrate",
			4:"Pop Quiz"
		}
	},
	"helm": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/helm/helm-spritesheet.png",
		moves = {
			1:"Three-Stage Amp",
			2:"Interrupt Vector",
			3:"No Curve",
			4:"Differentiate"
		}
	},
	"nikishin": {
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/nikishin/nikishin-spritesheet.png",
		moves = {
			1:"Sips Waterbottle, Grimace",
			2:"Final Solution",
			3:"No Curve",
			4:"Pop Quiz"
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
			1:"Computer Vision",
			2:"Machine Learning",
			3:"Integrate",
			4:"Differentiate"
		}
	}, 
	"stephens":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/stephens/stephens-spritesheet.png",
		moves = {
			1:"Fourier Transform",
			2:"Convolution",
			3:"Pop Quiz",
			4:"Integrate"
		}
	},
	"storrs":{
		hp = 100,
		strength = 10,
		def = 10,
		intel = 10,
		sprite = "res://Sprites/storrs/storrs-spritesheet.png",
		moves = {
			1:"Linear Transformation",
			2:"Node Voltage Analysis",
			3:"No Curve",
			4:"Differentiate"
		}
	}
}
var prof_current = {}

var prof_battle;

var player_buffered_position = Vector2(794, 569)
var temp_player_roster = prof_current

func _ready():
	pass # Replace with function body.


