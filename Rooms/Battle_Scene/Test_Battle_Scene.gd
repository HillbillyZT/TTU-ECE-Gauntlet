extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var professor_awdict = Globals.prof_current[Globals.prof_battle]
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
