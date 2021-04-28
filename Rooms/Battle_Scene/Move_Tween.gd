extends Tween

# =========================== MEMBERS & CONSTANTS ==============================
# onready var Player_Prof := get_parent().get_node("Player Prof")
# onready var Enemy_Prof  := get_parent().get_node("Enemy Prof")
var old_pos
var old_scale


# ============================ SIGNAL PROCESSING ===============================

func _ready():
	self.connect("tween_completed", self, "tween_completed")

func tween_all_completed():
	pass

func tween_completed(obj, key):
	print("timeout : obj = ",obj,", key = ", key)
	if key == ":shift":
		user_shift_back(obj, self.old_pos)
	elif key == ":scale":
		user_scale_back(obj, self.old_scale)
	# if self.prof_name != null:
	# 	print(self.prof_name)
	# return

# ================================ FUNCTIONS ===================================

func user_shift(prof, pos_diff, duration=.25):
	self.old_pos = prof.position
	self.interpolate_property(
		prof,
		"position",
		prof.position,
		prof.position + pos_diff,
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	self.start()
	return
	
func user_shift_back(prof, duration=.25):
	self.interpolate_property(
		prof,
		"position",
		prof.position,
		self.old_pos,
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	self.start()
	return

func user_scale(prof, scale_factor, duration=.25):
	self.old_scale = 1/scale_factor
	self.interpolate_property(
		prof,
		"scale",
		prof.get_scale(),
		Vector2(scale_factor, scale_factor),
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	self.start()
	return

func user_scale_back(prof, duration=.25):
	self.interpolate_property(
		prof,
		"scale",
		prof.get_scale(),
		Vector2(self.old_scale, self.old_scale),
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	self.start()
	return
