extends Node

var player_GPA = 0.0
var player_Courses_Taken = 0

func calc_GPA(letter):
	var gpa = player_GPA
	gpa = gpa * player_Courses_Taken
	gpa = gpa + letter
	player_Courses_Taken = player_Courses_Taken + 1
	player_GPA = gpa / player_Courses_Taken

const prof_base = {
	"gale": {
		hp = 100,
		strength = 10,
		defense = 10,
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
		defense = 10,
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
		defense = 10,
		intel = 10,
		sprite = "res://Sprites/nikishin/nikishin-spritesheet.png",
		moves = {
			1:"Sip Water",
			2:"Divergence",
			3:"No Curve",
			4:"Pop Quiz"
		}
	},
	"sarraf": {
		hp = 100,
		strength = 10,
		defense = 10,
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
		defense = 10,
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
		defense = 10,
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

const move_base = {
	"Ventilate" : {
		type = "dmg",
		dmg = 3
	},
	"Recruitment" : {	# 60% usr atk, 20% enemy atk
		type = "stat+-",
		stat_s = Vector3(1.6, 0, 0),
		stat_e = Vector3(1.2, 0, 0)
	},
	"Integrate" : {
		type = "dmg",
		dmg = 2.5
	},
	"Pop Quiz" : {
		type = "dmg",
		dmg = 2.5
	},
	"Three-Stage Amp" : {	# 300% all str, def
		type = "stat+",
		stat_s = Vector3(3, 3, 3)
	},
	"Interrupt Vector" : {
		type = "dmg",
		dmg = 3
	},
	"No Curve" : {
		type = "dmg",
		dmg = 2.5
	},
	"Differentiate" : {
		type = "dmg",
		dmg = 2.5
	},
	"Sip Water" : {			# atk++, def-, int-
		type = "stat+",
		stat_s = Vector3(2, 0.5, 0.5)
	},
	"Divergence" : {		# use atk + int SPECIAL
		type = "dmg",
		dmg = 1
	},
	"Computer Vision" : {	# on enemy
		type = "stat-",
		stat_e = Vector3(.75, .75, 0)
	},
	"Machine Learning" : {	# int
		type = "stat+",
		stat_s = Vector3(0,0,1.5)
	},
	"Fourier Transform" : {	# def buff
		type = "stat+",
		stat_s = Vector3(0,1.5,0)
	},
	"Convolution" : {		# dmg += (atk+def+int)*mult SPECIAL
		type = "dmg",
		dmg = 1.1
	},
	"Linear Transformation" : {
		type = "stat+",
		stat_s = Vector3(1.5, 1.5, 0)
	},
	"Node Voltage Analysis" : {
		type = "dmg",
		dmg = 4
	}
}

const item_base = {
	"TI-84":{
		"Name":"TI-84",
		"Type":"defense",
		"Boost": 5
	},
	"Multimeter":{
		"Name":"Multimeter",
		"Type":"hp",
		"Boost": 10
	},
	"Soldering Iron":{
		"Name":"Soldering Iron",
		"Type":"strength",
		"Boost": 5
	}
}


var prof_current = {}

var prof_battle;

var player_buffered_position = Vector2(794, 569)
var player_buffered_velocity = Vector2(0,0)

var temp_player_roster = prof_current.duplicate()
func _ready():
	pass # Replace with function body.


