extends Sprite

# =========================== MEMBERS & CONSTANTS ==============================
const SPRITE_W = 13
const SPRITE_H = 19
const SPRITE_SIZE = Vector2(SPRITE_W, SPRITE_H)
const SPRITE_SCALE = 5
onready var move_effect = get_parent().get_node("Move_Tween")


# ============================ SIGNAL PROCESSING ===============================
func _ready():
	var path_to_sprite = Globals.temp_player_roster \
							[Globals.temp_player_roster.keys()[0]] \
							["sprite"]
	self.texture = get_sprite_back_tex(path_to_sprite)

func _on_Battle_Scene_Test_change_texture(path_to_sprite):
	self.texture = get_sprite_back_tex(path_to_sprite)

func _used_move(move):
	print(self.get_path())
	if Globals.move_base[move].type == "dmg":
		pass
	elif Globals.move_base[move].type == "stat+":
		move_effect.user_scale(self, 1.25)
		move_effect.user_shift(self, Vector2(0, -12))
		# move_effect.start()
		# move_effect.user_scale(self, .8)
		# move_effect.user_shift(self, Vector2(0, 12))
		# move_effect.start()
	elif Globals.move_base[move].type == "stat-":
		pass
	elif Globals.move_base[move].type == "stat+-":
		pass
	


# ================================ FUNCTIONS ===================================
func get_sprite_back_tex(sprite_path):
	var sprite = Image.new()
	if sprite.load(sprite_path) != OK:
		print("FRIENDLY PROF SPRITE SHEET FAILED TO LOAD")
	# Get back-facing sprite Image, scale
	sprite.blit_rect(sprite, Rect2(Vector2(0, 72), SPRITE_SIZE), Vector2.ZERO)
	sprite.crop(SPRITE_W, SPRITE_H)
	sprite.resize(SPRITE_W*SPRITE_SCALE, SPRITE_H*SPRITE_SCALE, 0)
	# Get back-facing sprite Texture
	var sprite_tex = ImageTexture.new()
	sprite_tex.create_from_image(sprite, 0)
	return sprite_tex
