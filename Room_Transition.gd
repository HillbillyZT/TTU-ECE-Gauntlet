extends Area2D

export var portal_exit_pos = Vector2(0,0)
export var room_destination = 0

var timeout = false

onready var my_timer = $Timer

func _physics_process(delta):
	# IF TIMER NOT ACTIVE
	if(timeout): return
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			# START TIMER
			timeout()
			#get_tree().change_scene("res://Rooms/Test_Room.tscn") #no persistence
			#Globals.new_player_pos = body.position
			Globals.player_buffered_position = portal_exit_pos
			if(room_destination == -1):
				SceneSwitcher.change_scene(SceneSwitcher.world_scene)
			else:
				SceneSwitcher.change_scene(SceneSwitcher.rooms[room_destination]) #wrong, impersistent
			#SceneSwitcher.change_scene(SceneSwitcher.rooms[0])
	
func timeout():
	timeout = true
	my_timer.start()


func _on_Timer_timeout():
	timeout = false
