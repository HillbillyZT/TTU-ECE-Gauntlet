extends Area2D
# This object manages the spawning of professors in the rooms. It will be 
# triggered by a signal, and check whether or not there is an existing professor
# before trying to spawn a new one.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
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
	#var professor = selectProfessor(); #Will be used once select_professor impl.
	var bodies = get_overlapping_bodies()
	for b in bodies:
		print(b.name)

# Stub. Decide what professor to spawn, with what stats, etc.
func select_professor():
	pass
