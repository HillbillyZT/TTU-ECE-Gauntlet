extends Tween

# =========================== MEMBERS & CONSTANTS ==============================
# onready var Player_Prof := get_parent().get_node("Player Prof")
# onready var Enemy_Prof  := get_parent().get_node("Enemy Prof")



# ============================ SIGNAL PROCESSING ===============================


# ================================ FUNCTIONS ===================================

func move_dmg(user, target):
	var direction
	if user == "Player Prof":
		direction = 1
	else:
		direction = -1
	var prof_user = self.get_parent().get_node(user)
	var prof_target = self.get_parent().get_node(target)
	
	self.user_shift(prof_user, Vector2(48*direction, 0), .25)
	self.start()
	yield(get_tree().create_timer(.15), "timeout")
	
	self.user_rotate(prof_target, 10*direction, .25)
	self.start()
	yield(get_tree().create_timer(.35), "timeout")
	
	self.user_shift(prof_user, Vector2(-48*direction, 0), .25)
	self.start()
	yield(get_tree().create_timer(.25), "timeout")
	
	self.user_rotate(prof_target, -10*direction, .25)
	self.start()
	yield(get_tree().create_timer(.25), "timeout")

func move_statp(user):
	var prof_user = self.get_parent().get_node(user)
	self.user_scale(prof_user, 1.25, .5)
	self.user_shift(prof_user, Vector2(0, -12), .5)
	self.start()
	yield(get_tree().create_timer(.75), "timeout")
	self.user_scale(prof_user, 1, .25)
	self.user_shift(prof_user, Vector2(0, 12), .25)
	self.start()
	yield(get_tree().create_timer(.75), "timeout")

func move_statm(target):
	var prof_target = self.get_parent().get_node(target)
	self.user_scale(prof_target, .75, .5)
	self.user_shift(prof_target, Vector2(0, 12), .5)
	self.start()
	yield(get_tree().create_timer(.75), "timeout")
	self.user_scale(prof_target, 1, .25)
	self.user_shift(prof_target, Vector2(0, -12), .25)
	self.start()
	yield(get_tree().create_timer(.25), "timeout")

func move_statpm(user, target):
	var prof_user = self.get_parent().get_node(user)
	var prof_target = self.get_parent().get_node(target)
	self.user_scale(prof_user, 1.25, .5)
	self.user_shift(prof_user, Vector2(0, -12), .5)
	self.user_scale(prof_target, .75, .5)
	self.user_shift(prof_target, Vector2(0, 12), .5)
	self.start()
	yield(get_tree().create_timer(.75), "timeout")
	self.user_shift(prof_target, Vector2(0, -12), .25)
	self.user_scale(prof_target, 1, .25)
	self.user_scale(prof_user, 1)
	self.user_shift(prof_user, Vector2(0, 12))
	self.start()

func user_shift(prof, pos_diff, duration=.25):
	self.interpolate_property(
		prof,
		"position",
		prof.position,
		prof.position + pos_diff,
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	return

func user_scale(prof, scale_factor, duration=.25):
	self.interpolate_property(
		prof,
		"scale",
		prof.get_scale(),
		Vector2(scale_factor, scale_factor),
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	return

func user_rotate(prof, rot_deg, duration=.25):
	self.interpolate_property(
		prof,
		"rotation_degrees",
		prof.get_rotation_degrees(),
		prof.get_rotation_degrees() + rot_deg,
		duration,
		Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	return
