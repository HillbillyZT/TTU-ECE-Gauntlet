extends Node2D

var approached: bool = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_PlayerDetector_body_entered(body):
	if(approached): return # FOR DEBUGGING ONLY
	var bodies = $PlayerDetector.get_overlapping_bodies()
	print(bodies)
	print("pepe")
	for body in bodies:
		print(body)
		if body.name == "Player":
			approached = true
			SceneSwitcher.change_scene_instanced("res://Rooms/Battle_Scene/Test_Battle_Scene.tscn")
