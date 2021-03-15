extends Area2D
signal Open_Shop

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if (body.name == "Player"):
			emit_signal("Open_Shop")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
