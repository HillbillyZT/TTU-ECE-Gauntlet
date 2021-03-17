extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene("res://Rooms/Test_Room.tscn") #no persistence
			#SceneSwitcher.change_scene_instanced("res://Rooms/Test_Room.tscn") #wrong, impersistent
	
