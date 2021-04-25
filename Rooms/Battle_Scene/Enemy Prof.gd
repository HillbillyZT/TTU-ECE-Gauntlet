extends Sprite

# ============================= DEFINE CONSTANTS ===============================
const SPRITE_W = 13
const SPRITE_H = 24
const SPRITE_SCALE = 5


# ============================ SIGNAL PROCESSING ===============================
func _ready():
	var path_to_sprite = Globals.prof_current[Globals.prof_battle]["sprite"]
	self.texture = get_sprite_front_tex(path_to_sprite)
	

# ================================ FUNCTIONS ===================================
func get_sprite_front_tex(sprite_path):
	var sprite = Image.new()
	if sprite.load(sprite_path) != OK:
		print("ENEMY PROF SPRITE SHEET FAILED TO LOAD")
	# Get front-facing sprite Image, scale
	sprite.crop(SPRITE_W, SPRITE_H)
	sprite.resize(SPRITE_W*SPRITE_SCALE, SPRITE_H*SPRITE_SCALE, 0)
	# Get front-facing sprite Texture
	var sprite_tex = ImageTexture.new()
	sprite_tex.create_from_image(sprite, 0)
	return sprite_tex
