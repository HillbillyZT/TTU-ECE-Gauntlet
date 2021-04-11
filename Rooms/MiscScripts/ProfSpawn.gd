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


# Stub. This method will handle professor spawning.
# Called by signal from item shop.
func spawn_professor():
	var professor = generate_professor()
	var prof_obj = PWO.instance()
	prof_obj.position = self.position
	prof_obj.init(professor[0], professor[1])
	
	add_child(prof_obj)
	
	var bodies = get_overlapping_bodies()
	for b in bodies:
		print(b.name)

# Stub. Decide what professor to spawn, with what stats, etc.
func generate_professor():
	var professor_name = select_professor()
	var professor_gen = Globals.prof_base.get(professor_name)
	
	# augment stats based on position modifier
	for key in professor_gen:
		if(key == "sprite"): continue
		professor_gen[key] = ceil(professor_gen[key] * (statMod / 1000.0))
	
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
