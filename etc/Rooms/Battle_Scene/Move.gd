extends Button

# =========================== MEMBERS & CONSTANTS ==============================
onready var tween := $Move_Tween


# ============================ SIGNAL PROCESSING ===============================
signal used_move(move)
signal b_player_move(key)

func _ready():
	self.connect("used_move", BattleHandler, "_on_player_move")
	pass

func _pressed():
	emit_signal("used_move",self.text)
	

# ================================ FUNCTIONS ===================================
