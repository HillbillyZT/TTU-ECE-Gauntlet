extends Area2D
# This object manages the spawning of professors in the rooms. It will be 
# triggered by a signal, and check whether or not there is an existing professor
# before trying to spawn a new one.

onready var Globals = get_node("/root/Globals")
const PWO = preload("res://Professor/ProfessorWorldObj.tscn")

export var statMod = 100

func _ready():
	attempt_spawn()

func attempt_spawn():
	#var professor = selectProfessor(); #Will be used once select_professor impl.
	var to_spawn = true
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if(b.is_in_group("Professors")): 
			to_spawn = false
	if(to_spawn):
		spawn_professor()
	
	#REMOVE LATER
	Globals.temp_player_roster = Globals.prof_current.duplicate()



func spawn_professor():
	var professor = generate_professor()
	var prof_obj = PWO.instance()
	prof_obj.position = self.position
	prof_obj.init(professor[0], professor[1])
	
	add_child(prof_obj)
	
	var bodies = get_overlapping_bodies()
	for b in bodies:
		print(b.name)


func generate_professor():
	var professor_name = select_professor()
	var professor_gen = Globals.prof_base.get(professor_name)
	Globals.prof_current[professor_name] = professor_gen
	professor_gen = Globals.prof_current[professor_name]
	
	# augment stats based on position modifier
	for key in professor_gen:
		if(key == "sprite"||key == "moves"): continue
		
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		if(key != "hp"):	# set professor[key] with noise
			professor_gen[key] = stepify((professor_gen[key] * \
								(statMod / 100.0) + rng.randf_range(-2,2)), .1)
		else:				# set HP with larger amp noise and create max_hp key
			professor_gen[key] = stepify(professor_gen[key] + rng.randi_range(-20,20), 1)
			professor_gen["max_hp"] = professor_gen[key]
			
	return [professor_name, professor_gen]

func select_professor():
	if(Globals.prof_current.size() == Globals.prof_base.size()): return null
	
	var key = null
	var keys = Globals.prof_base.keys()
	
	randomize()
	key = keys[randi() % keys.size()]
	while(Globals.prof_current.has(key)):
		key = keys[randi() % keys.size()]
	
	Globals.prof_current[key] = 1 #placeholder non-null value
	return (key)
