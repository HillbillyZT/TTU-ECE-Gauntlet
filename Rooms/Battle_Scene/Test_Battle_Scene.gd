extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_texture
signal change_moves
var cur_prof



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _change_cur_prof(prof):
	cur_prof = prof
	print(cur_prof)
	emit_signal("change_texture", cur_prof)
	emit_signal("change_moves",Globals.temp_player_roster[cur_prof]["moves"])
