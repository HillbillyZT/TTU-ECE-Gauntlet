extends Sprite

# =========================== MEMBERS & CONSTANTS ==============================
var player_prof_name
# Sprite Insertion
const SPRITE_W = 13
const SPRITE_H = 19
const SPRITE_SIZE = Vector2(SPRITE_W, SPRITE_H)
const SPRITE_SCALE = 5
# Tweening
onready var move_effect = get_parent().get_node("Move_Tween")
# Character tag
onready var health_bar = get_parent().get_node("Player_Ctrl_Tags/Player_HB")
onready var name_tag = get_parent().get_node("Player_Ctrl_Tags/Player_Name")
onready var health_frac = get_parent().get_node("Player_Ctrl_Tags/Player_Health")


# ============================ SIGNAL PROCESSING ===============================
func _ready():
	player_prof_name = Globals.temp_player_roster.keys()[0]
	# Load sprite
	load_prof_back_tex(player_prof_name)
	# Set up health bar and set name tag
	health_bar.max_value = Globals.temp_player_roster[player_prof_name]["max_hp"]
	name_tag.text = player_prof_name

func _process(delta):
	health_bar.value = Globals.temp_player_roster[player_prof_name]["hp"]
	health_frac.text = str(int(health_bar.value)) \
					 + '/' \
					 + str(int(health_bar.max_value))
	
	

func _on_Battle_Scene_Test_change_texture(prof_name):
	player_prof_name = prof_name
	# Load sprite
	load_prof_back_tex(player_prof_name)
	# Set up health bar
	var prof_max_hp = Globals.temp_player_roster[player_prof_name]["max_hp"]
	health_bar.max_value = prof_max_hp
	name_tag.text = player_prof_name

func _used_move(move):
	if Globals.move_base[move].type == "dmg":
		move_effect.move_dmg("Player Prof", "Enemy Prof")
	elif Globals.move_base[move].type == "stat+":
		move_effect.move_statp("Player Prof")
	elif Globals.move_base[move].type == "stat-":
		move_effect.move_statm("Enemy Prof")
	elif Globals.move_base[move].type == "stat+-":
		move_effect.move_statpm("Player Prof", "Enemy Prof")
	

# ================================ FUNCTIONS ===================================
func load_prof_back_tex(prof_name):
	var path_to_sprite = Globals.temp_player_roster[prof_name]["sprite"]
	var sprite = Image.new()
	if sprite.load(path_to_sprite) != OK:
		print("FRIENDLY PROF SPRITE SHEET FAILED TO LOAD")
	# Get back-facing sprite Image, scale
	sprite.blit_rect(sprite, Rect2(Vector2(0, 72), SPRITE_SIZE), Vector2.ZERO)
	sprite.crop(SPRITE_W, SPRITE_H)
	sprite.resize(SPRITE_W*SPRITE_SCALE, SPRITE_H*SPRITE_SCALE, 0)
	# Get back-facing sprite Texture
	var sprite_tex = ImageTexture.new()
	sprite_tex.create_from_image(sprite, 0)
	self.texture = sprite_tex
