extends Area2D

# Redo with signals
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			#get_tree().change_scene("res://Rooms/Battle_Scene/Test_Battle_Scene.tscn")
			SceneSwitcher.change_scene_instanced("res://Rooms/Battle_Scene/Test_Battle_Scene.tscn")
