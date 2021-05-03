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
signal bh_battle_ended


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_state_vars()
	pass # Replace with function body.

func _process(delta):
	cpu_logic()
#	if(active_prof == cpu_prof && in_battle): 
#		call_deferred("_on_cpu_move", "0")

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
		move_dmg = move_d.dmg * \
			(s_prof.strength + s_prof.defense + s_prof.intel)
	elif(move == "Divergence"):
		move_dmg = move_d.dmg * s_prof.strength + s_prof.defense
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
	

func end_battle(player_wins: bool):
	if(player_wins):
		Globals.calc_GPA(4)
		emit_signal("bh_battle_ended", "win")
	else:
		Globals.calc_GPA(2)
		emit_signal("bh_battle_ended", "loss")
	
	reset_state_vars()
	cpu_prof = null;
	player_prof = null;
	active_prof = null;
	in_battle = false;
	
	# Fun time is over
	SceneSwitcher.change_scene(SceneSwitcher.prev_scene) 

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
	# yield(get_tree().create_timer(1.5 + randf() - 0.5), "timeout")
	handle_move(key)
	# Validate move unnecessary
	_on_move(key)

# Called after every move
func _on_move(move):
	var names = get_prof_names()
	# Emit signal with move, player, cpu names
	var params = []
	if(active_prof == player_prof):
		params[0] = "Player Prof"
		params[1] = "Enemy Prof"
	else:
		params[1] = "Player Prof"
		params[0] = "Enemy Prof"
	
	emit_signal("bh_used_move", move, names[0], names[1])
	
	yield(get_tree().create_timer(2), "timeout")
	
	if(player_prof.hp <= 0):
		#yield(get_tree().create_timer(2.5), "timeout")
		end_battle(false)
		return
	elif(cpu_prof.hp <= 0):
		#yield(get_tree().create_timer(2.5), "timeout")
		end_battle(true)
		# SceneSwitcher.change_scene(SceneSwitcher.prev_scene) 
		return
	
	# Change active prof
	active_prof = cpu_prof if (active_prof == player_prof) else player_prof
	if(active_prof == cpu_prof): set_cpu_turn()
	# if(active_prof == cpu_prof): _on_cpu_move("0")
	

	

	
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

var cpu_turn: bool = false
func set_cpu_turn():
	cpu_turn = true

func cpu_logic():
	if(cpu_turn):
		cpu_turn = false
		
		var move = (randi() % 4) + 1
		
		_on_cpu_move(cpu_prof.moves[move])
