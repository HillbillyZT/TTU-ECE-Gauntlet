extends Node2D
#class_name ProfessorWorldObj

var approached: bool = false

onready var stats = $StatBoi
var prof_name: String

func init(prof_name, prof_stats: Dictionary):
	stats = $StatBoi
	position = Vector2.ZERO
	stats.setStats(prof_stats.hp, prof_stats.strength, prof_stats.defense, prof_stats.intel)
	self.prof_name = prof_name
	var sprite = $Sprite
	sprite.texture = load(prof_stats.sprite)
	if(prof_name == "nutter"):
		sprite.vframes = 1
		sprite.hframes = 1
	else:
		sprite.vframes = 4
		sprite.hframes = 4
	pass

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
			body.velocity = Vector2.ZERO
			Globals.prof_battle = self.prof_name
			Globals.player_buffered_position = body.position
			SceneSwitcher.change_scene_instanced("res://Rooms/Battle_Scene/Test_Battle_Scene.tscn")
