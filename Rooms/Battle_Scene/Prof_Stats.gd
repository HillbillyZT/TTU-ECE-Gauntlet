extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/BattleHandler").connect("prof_HP", self, "_update_prof_HP")
	get_node("/root/BattleHandler").connect("prof_HP_max", self, "_set_prof_HP")
	pass # Replace with function body.

func _set_prof_HP(p_profHP_max, e_profHP_max):
	print("Max HP of p_prof: %i" % p_profHP_max)
	print("Max HP of e_prof: %i" % e_profHP_max)

func _update_prof_HP(p_profHP, e_profHP):
	# print(p_profHP)
	# print(e_profHP)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
