extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false





func _on_Back_back_button_pressed():
	self.visible = false

func Button_Pressed(Button_Name):
	self.text = """Hi,you clicked the {str} Button""".format({"str": Button_Name})
	
func _on_Prof1_Prof_Pressed():
	self.visible = true
	Button_Pressed("Prof 1")

func _on_Prof2_Prof2_Pressed():
	self.visible = true
	Button_Pressed("Prof 2")


func _on_Prof3_Prof3_Pressed():
	self.visible = true
	Button_Pressed("Prof 3")


func _on_Prof4_Prof4_Pressed():
	self.visible = true
	Button_Pressed("Prof 4")


func _on_Prof5_Prof5_Pressed():
	self.visible = true
	Button_Pressed("Prof 5")


func _on_Prof6_Prof6_Pressed():
	self.visible = true
	Button_Pressed("Prof 6")

