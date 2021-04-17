extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_texture
signal change_moves
var cur_prof

# Called when the node enters the scene tree for the first time.
func _ready():
	var professor_awdict = Globals.prof_current[Globals.prof_battle]
	var keys = Globals.temp_player_roster.keys()
	cur_prof = Globals.temp_player_roster[keys[0]] 
	if Globals.prof_battle != null:
		print(Globals.prof_battle)
	else:
		print("ZOINKS")
	
	# var key = Globals.prof_current.find(Globals.prof_battle)
	# var prof = Globals.prof_base[key]
	# print(prof)
	# if (Globals.prof_current.size() > 0):
		# for prof in Globals.prof_current:
			
			# var key = Globals.prof_current.find(Globals.prof_battle)
	pass # Replace with function body.

func _change_cur_prof(prof):
	cur_prof = prof
	print(cur_prof)
	emit_signal("change_texture",Globals.temp_player_roster[cur_prof]["sprite"])
	emit_signal("change_moves",Globals.temp_player_roster[cur_prof]["moves"])	
