extends Area2D

export var portal_exit_pos = Vector2(0,0)


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			#get_tree().change_scene("res://Rooms/Test_Room.tscn") #no persistence
			#Globals.new_player_pos = body.position
			SceneSwitcher.change_scene_instanced("res://Rooms/Test_Room.tscn") #wrong, impersistent
			#SceneSwitcher.change_scene(SceneSwitcher.rooms[0])
	
