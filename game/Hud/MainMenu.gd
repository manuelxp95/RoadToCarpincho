extends Control



func _on_ButtonStart_pressed():
	get_tree().change_scene("res://game/Levels/LevelSample.tscn")
	GlobalSfx.startmusic()



func _on_ButtonExit_pressed():
	get_tree().quit()


#-------------Score Menu
func _on_ButtonScores_pressed():
	$Scores/AnimationScore.play("select_in")


func _on_ButtonBack_pressed():
	$Scores/AnimationScore.play("select_out")
