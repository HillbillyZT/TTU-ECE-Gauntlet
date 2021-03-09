extends Node2D

#StatBoi contains all stats relevant to a professor. This is generated on spawn 
#and shared between world and battle entities of professors.
var level: int
var XP: int
var current_hp: int

#Call down, signal up. When the hp drops below zero, we emit a signal saying
#as much
signal is_dead

export var stat_health: int = 10
export var stat_str: int = 10
export var stat_int: int = 10
export var stat_def: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(hp: int, strength: int, def: int, intel: int):
	stat_health = hp
	stat_str = strength
	stat_def = def
	stat_int = intel 
	current_hp = hp
	pass

#TODO hook up to signal from damaging controller, argument dmg
func damage(dmg: int):
	current_hp = current_hp - dmg


func is_dead():
	if(current_hp <= 0): 
		emit_signal("is_dead")
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
