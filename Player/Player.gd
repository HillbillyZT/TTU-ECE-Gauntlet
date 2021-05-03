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
	_on_update_player_pos()
	
	#Signal Connections
	SceneSwitcher.connect("update_player_pos", self, "_on_update_player_pos")
	SceneSwitcher.connect("player_update", self, "_on_player_update")
	SceneSwitcher.connect("player_store", self, "_on_player_store")
	

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

func _on_update_player_pos():
	self.position = Globals.player_buffered_position
	self.velocity = Globals.player_buffered_velocity

func _on_player_update():
	pass

func _on_player_store():
	pass

func _on_Shop_Open_Shop():
	var children = self.get_children()
	for child in children:
		if child.name == "Player_Shop":
			child.visible = true


func _on_Too_Far_From_Shop_too_far():
	var children = self.get_children()
	for child in children:
		if child.name == "Player_Shop":
			child.visible = false


func _on_ECE_Map_return_list(items):
	#plz help, this is horrifying.... but works :)
	var i = 0
	for child in self.get_children():
		if child.name == "Player_Shop":
			for childs in child.get_children():
				if childs.name == "Items":
					for childe in childs.get_children():
						childe.text = items[i]
						i += 1
