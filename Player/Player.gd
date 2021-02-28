extends KinematicBody2D

const MAX_SPEED = 105
const ACCELERATION = 1000
const FRICTION = 1000


var input_vector: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if(input_vector != Vector2.ZERO):
		velocity = velocity.move_toward(input_vector * MAX_SPEED, delta * ACCELERATION)
	else:
		velocity =  velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	#allows for the player to sprint (Purely Debug Tool)
	if(Input.is_action_pressed("ui_sprint")):
		velocity = velocity.move_toward(input_vector * MAX_SPEED * 10, delta * ACCELERATION * 10)
	
	move_and_slide(velocity)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
