extends Control

func _input(event:InputEvent) ->void:
	if event.is_action_pressed("ui_accept"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://game/Levels/Level1.tscn")
