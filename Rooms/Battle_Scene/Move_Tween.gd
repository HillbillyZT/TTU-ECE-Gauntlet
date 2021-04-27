extends Tween

# =========================== MEMBERS & CONSTANTS ==============================
onready var Player_Prof := get_parent().get_node("Professors"). \
						   get_node("Player Prof")
onready var Enemy_prof  := get_parent().get_node("Professors"). \
 						   get_node("Enemy Prof")


# ============================ SIGNAL PROCESSING ===============================
func _ready():
	pass # Replace with function body.

func _used_move(user, move):
	if Globals.move_base[move].type == "dmg":
		atk_anim(user)
	elif Globals.move_base[move].type == "stat+":
		stat_anim_p(user)
	elif Globals.move_base[move].type == "stat-":
		stat_anim_m(user)
	elif Globals.move_base[move].type == "stat+-":
		stat_anim_pm(user)


# ================================ FUNCTIONS ===================================
func atk_anim(usr):
	print("%s attacks!" % usr)
	if usr == "Player":
		self.interpolate_property(
			Player_Prof,
			"position",
			Vector2(100, 100),
			1,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)
	return

func stat_anim_p(usr):
	print("%s boosts their stats!" % usr)
	if usr == "Player":
		print("usr IS Player")
		print(Player_Prof.get_scale())
		self.interpolate_property(
			Player_Prof,
			'transform/scale',
			Player_Prof.get_scale(),
			Vector2(2.0, 2.0),
			1,
			Tween.TRANS_QUAD,
			Tween.EASE_OUT
		)
		self.start()

func stat_anim_m(usr):
	print("%s lowers opponents stats!" % usr)

func stat_anim_pm(usr):
	print("%s boosts their stats and lowers their opponents stats!" % usr)
