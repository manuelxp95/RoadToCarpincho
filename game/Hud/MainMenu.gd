extends Control

var player_data

onready var scores= $Scores/Camera2D/Panel/VBoxContainer

func _ready():
	player_data = SaveMaster.data
	DataPlayer.reset()
	set_scores()


func set_scores():
	for i in player_data.size():
		scores.get_node("Score{i}".format({"i":i+1})).text=( str((player_data[i])[0])+" "+str((player_data[i])[1]))


func _on_ButtonStart_pressed():
	if DataPlayer.first_time ==true:
		get_tree().change_scene("res://game/Hud/Tutorial.tscn")
		DataPlayer.first_time= false
	else:
		get_tree().change_scene("res://game/Levels/Level1.tscn")
	GlobalSfx.startmusic()


func _on_ButtonExit_pressed():
	get_tree().quit()


#-------------Score Menu
func _on_ButtonScores_pressed():
	$Scores/AnimationScore.play("select_in")


func _on_ButtonBack_pressed():
	$Scores/AnimationScore.play("select_out")
