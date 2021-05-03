extends Node

var active_prof;
var cpu_prof;
var player_prof;

var in_battle = false;

var move_dmg = 0;
var move_heal = 0;
var move_stat = Vector3.ZERO
var move_stat_dir = -1;

signal bh_used_move;


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_state_vars()
	pass # Replace with function body.

# state vars used all da time
func reset_state_vars():
	move_dmg = 0;
	move_heal = 0;
	move_stat = Vector3.ZERO
	move_stat_dir = -1;

#given move name, 
func handle_move(move):
	var move_d = Globals.move_base[move]
	
	# Start from 0 initial conditions
	reset_state_vars()
	
	# Set dicts
	var s_prof = active_prof
	var e_prof
	if(active_prof == player_prof):
		e_prof = cpu_prof
	else:
		e_prof = player_prof
	
	# Modify stats, damage buffer
	if(move == "Convolution"):
		move_dmg = move_d[move].dmg * \
			(s_prof.strength + s_prof.defense + s_prof.intel)
	elif(move == "Divergence"):
		move_dmg = move_d[move].dmg * s_prof.strength + s_prof.defense
	else:
		for key in move_d.keys():
			match(key):
				"dmg": move_dmg = move_d[key] * s_prof["strength"]
				"stat_s": 
					s_prof.strength *= move_d[key].x
					s_prof.defense *= move_d[key].y
					s_prof.intel *= move_d[key].z
				"stat_e":
					e_prof.strength *= move_d[key].x
					e_prof.defense *= move_d[key].y
					e_prof.intel *= move_d[key].z
	
	# Apply damage buffer
	e_prof.hp -= move_dmg

# Probably keys for plr/cpu
func init_battle(var plr, var cpu):
	cpu_prof = cpu
	player_prof = plr
	active_prof = plr
	#active_prof = cpu_prof if ((randi() % 2)==1) else player_prof;
	in_battle= true;
	

func end_battle():
	cpu_prof = null;
	player_prof = null;
	active_prof = null;
	in_battle = false;

# Signal (key = profname)
func _on_player_change_profs(key):
	pass

# Signal (key = profname)
func _on_player_move(move):
	# Validate move
	if(active_prof != player_prof):
		return
	handle_move(move)
	
	_on_move(move)
	
	pass

# Signal (key = profname)
func _on_cpu_move(key):
	# Wait for a short bit to make it feel more interactive
	yield(get_tree().create_timer(1.5 + randf() - 0.5), "timeout")
	
	# Validate move unnecessary
	_on_move(key)

# Called after every move
func _on_move(move):
	# Check player and cpu prof HP after every move
	if(player_prof.hp <= 0):
		pass
	elif(cpu_prof.hp <= 0):
		Globals.calc_GPA(4)
		# SceneSwitcher.change_scene(SceneSwitcher.prev_scene) 
		pass
	
	# Change active prof
	active_prof = cpu_prof if (active_prof == player_prof) else player_prof
	if(active_prof == cpu_prof): _on_cpu_move("0")
	
	var names = get_prof_names()
	# Emit signal with move, player, cpu names
	emit_signal("bh_used_move", move, names[0], names[1])
	
	# End conditions, gpa, yeet cetera
	pass

# The least efficient function in this game??
func get_prof_names():
	var cpu_name
	var ppf_name
	
	for key in Globals.prof_current:
		if(Globals.prof_current[key] == cpu_prof):
			cpu_name=key
		if(Globals.temp_player_roster[key] == player_prof):
			ppf_name=key
	
	return [ppf_name, cpu_name]
