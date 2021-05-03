extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_TheHomieUpFront_body_entered(body):
	if(body.name == "Player"):
		Globals.temp_player_roster["storrs"] = {
			hp = 120,
			strength = 12,
			defense = 12,
			intel = 12,
			max_hp = 120,
			sprite = "res://Sprites/storrs/storrs-spritesheet.png",
			moves = {
				1:"Lin Trans",
				2:"Node Voltage",
				3:"No Curve",
				4:"Differentiate"
			}
		}
		Globals.calc_GPA(4)
		queue_free()
