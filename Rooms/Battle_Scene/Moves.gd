extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	var children = self.get_children()
	var keys = Globals.temp_player_roster.keys()
	children[0].text = Globals.temp_player_roster[keys[0]]["moves"][1]
	children[1].text = Globals.temp_player_roster[keys[0]]["moves"][2]
	children[2].text = Globals.temp_player_roster[keys[0]]["moves"][3]
	children[3].text = Globals.temp_player_roster[keys[0]]["moves"][4]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Battle_Scene_Test_change_moves(move_set):
	var children = self.get_children()
	children[0].text = move_set[1]
	children[1].text = move_set[2]
	children[2].text = move_set[3]
	children[3].text = move_set[4]
