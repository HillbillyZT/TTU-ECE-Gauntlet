extends Node
# Custom scene swapping tool created to allow for true persistence in world and 
# rooms.

# Declare scene vars
var world_scene

#always set to active scene
var current_scene = null


# Called when the node enters the scene tree for the first time.
func _ready():
	world_scene = get_tree().get_root().get_child( \
		get_tree().get_root().get_child_count() - 1)
	
	current_scene = world_scene


func change_scene(target: Node):
	remove_current_scene()
	current_scene = target #duh
	add_scene_compat() # add scene to tree


func change_scene_instanced(target: String):
	remove_current_scene()
	var new_scene = ResourceLoader.load(target)
	current_scene = new_scene.instance()
	add_scene_compat()


#add our desired scene to the tree
func add_scene_compat():
	get_tree().get_root().add_child(current_scene) #API compatibility
	get_tree().set_current_scene(current_scene)


# TODO add check against GROUP: PERSISTENT SCENE
func remove_current_scene():
	# if the current scene is not the world scene (TODO: GROUP),
	# then delete the scene; do not persist.
	if(current_scene != world_scene):
		current_scene.queue_free()
	# otherwise, just remove the scene from the tree. We want to keep its data.
	else:
		get_tree().get_root().remove_child(current_scene)
