extends Control



func _on_ButtonStart_pressed():
	get_tree().change_scene("res://game/Levels/LevelSample.tscn")



func _on_ButtonExit_pressed():
	get_tree().quit()
