extends Area2D
signal Open_Shop

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sent
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if (body.name == "Player"):
			if (!sent):
				emit_signal("Open_Shop")
				sent = 1
			else:
				pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_Shop_closed():
	sent = 0


func _on_Too_Far_From_Shop_too_far():
	sent = 0
