extends Control

func _ready():
	self.visible=false

func _input(event):
	if event.is_action_pressed("pause") and DataPlayer.lifes != 0:
		visible= !visible
		get_tree().paused= !get_tree().paused


func _on_ButtonResume_pressed():
	get_tree().paused=false
	visible = !visible


func _on_ButtonMain_pressed():
	get_tree().change_scene("res://game/Hud/MainMenu.tscn")
