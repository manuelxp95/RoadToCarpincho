extends Control



func _ready():
	$ColorRect/AnimationPlayer.play("idle")
	$Panel/VBoxContainer/ShowScore.text = str(DataPlayer.score)




func _on_ButtonReturn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://game/Hud/MainMenu.tscn")



func _on_InputName_text_entered(new_text):
	SaveMaster.new_score(new_text,DataPlayer.score)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://game/Hud/MainMenu.tscn")
