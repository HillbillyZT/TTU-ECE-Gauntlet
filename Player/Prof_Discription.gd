extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false





func _on_Back_back_button_pressed():
	self.visible = false


func _on_Prof1_Prof_Pressed():
	self.visible = true
	self.text = """Hi, You clicked the Prof 1 Button :)"""
