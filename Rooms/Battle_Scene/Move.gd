extends Button

# =========================== MEMBERS & CONSTANTS ==============================
onready var tween := $Move_Tween


# ============================ SIGNAL PROCESSING ===============================
signal used_move(move)

func _ready():
	pass

func _pressed():
	emit_signal("used_move",self.text)
	

# ================================ FUNCTIONS ===================================
