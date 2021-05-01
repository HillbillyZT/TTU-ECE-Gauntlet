extends Sprite

# ============================= DEFINE CONSTANTS ===============================
var enemy_prof_name
# Sprite Insertion
const SPRITE_W = 13
const SPRITE_H = 24
const SPRITE_SCALE = 5
# Tweening
onready var move_effect = get_parent().get_node("Move_Tween")
# Health bar and name tag
onready var health_bar = get_parent().get_node("Enemy_Ctrl_Tags/Enemy_HB")
onready var name_tag = get_parent().get_node("Enemy_Ctrl_Tags/Enemy_Name")
onready var health_frac = get_parent().get_node("Enemy_Ctrl_Tags/Enemy_Health")


# ============================ SIGNAL PROCESSING ===============================
func _ready():
	enemy_prof_name = Globals.prof_battle
	# Load sprite
	load_prof_front_tex(enemy_prof_name)
	# Set up health bar
	health_bar.max_value = Globals.prof_current[enemy_prof_name]["max_hp"]
	name_tag.text = enemy_prof_name

func _process(delta):
	health_bar.value = Globals.prof_current[enemy_prof_name]["hp"]
	health_frac.text = str(int(health_bar.value)) \
				 + '/' \
				 + str(int(health_bar.max_value))

# ================================ FUNCTIONS ===================================
func load_prof_front_tex(prof_name):
	var path_to_sprite = Globals.prof_current[prof_name]["sprite"]
	var sprite = Image.new()
	if sprite.load(path_to_sprite) != OK:
		print("ENEMY PROF SPRITE SHEET FAILED TO LOAD")
	# Get front-facing sprite Image, scale
	sprite.crop(SPRITE_W, SPRITE_H)
	sprite.resize(SPRITE_W*SPRITE_SCALE, SPRITE_H*SPRITE_SCALE, 0)
	# Get front-facing sprite Texture
	var sprite_tex = ImageTexture.new()
	sprite_tex.create_from_image(sprite, 0)
	self.texture = sprite_tex
