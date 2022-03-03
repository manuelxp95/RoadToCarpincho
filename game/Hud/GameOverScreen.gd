extends Control



func _ready():
	$ColorRect/AnimationPlayer.play("idle")

func _process(_delta):
	set_score()



func set_score():
	if DataPlayer.lifes == 0:
		$Panel/VBoxContainer/ShowScore.text = str(DataPlayer.score)
# warning-ignore:standalone_expression
		get_tree().paused



func _on_ButtonReturn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://game/Hud/MainMenu.tscn")



func _on_InputName_text_entered(new_text):
	SaveMaster.new_score(new_text,DataPlayer.score)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://game/Hud/MainMenu.tscn")
