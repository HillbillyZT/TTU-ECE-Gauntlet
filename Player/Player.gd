extends KinematicBody2D

const MAX_SPEED = 105
const ACCELERATION = 1000
const FRICTION = 1000
var items = []
var money = 0
var roster = []

var input_vector: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
onready var backpack = get_node("Backpack")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Player")
	backpack.visible = false
	self.position = Globals.player_buffered_position
	SceneSwitcher.connect("update_player_pos", self, "_on_update_player_pos")

func _physics_process(delta):
	$Sprite.playing = true
	if(Input.is_action_pressed("ui_left")): $Sprite.set_animation("walk_left")
	elif (Input.is_action_pressed("ui_right")): $Sprite.set_animation("walk_right")
	elif (Input.is_action_pressed("ui_down")): $Sprite.set_animation("walk_down")
	elif (Input.is_action_pressed("ui_up")): $Sprite.set_animation("walk_up")
	else: 
		$Sprite.playing = false
		$Sprite.frame = 0
	
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


func _input(event):
	if(event.is_action_pressed("ui_menu")):
		backpack.visible = !(backpack.visible)


func _on_Area2D_Open_Shop():
	var player = get_node(".")
	var children = player.get_children()
	for child in children:
		if child.name == "Player_Shop":
			child.visible = !child.visible

func _on_update_player_pos():
	self.position = Globals.player_buffered_position
