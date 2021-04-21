extends Button

# =========================== MEMBERS & CONSTANTS ==============================
onready var tween := $Move_Tween


# ============================ SIGNAL PROCESSING ===============================
signal used_move(user, move)

func _ready():
	pass

func _pressed():
	emit_signal("used_move", "Player", self.text)
	

# ================================ FUNCTIONS ===================================
