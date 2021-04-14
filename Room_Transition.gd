extends Area2D

export var portal_exit_pos = Vector2(0,0)
export var room_destination = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			#get_tree().change_scene("res://Rooms/Test_Room.tscn") #no persistence
			#Globals.new_player_pos = body.position
			Globals.player_buffered_position = portal_exit_pos
			if(room_destination == -1):
				SceneSwitcher.change_scene(SceneSwitcher.world_scene)
			else:
				SceneSwitcher.change_scene(SceneSwitcher.rooms[room_destination]) #wrong, impersistent
			#SceneSwitcher.change_scene(SceneSwitcher.rooms[0])
	
