extends ColorRect

onready var _trans_anim := $Trans_Anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_trans_anim.play("Fade_In")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
