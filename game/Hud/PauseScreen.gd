extends Control

func _ready():
	self.visible=false

func _input(event):
	if event.is_action_pressed("pause"):
		visible= !visible
		get_tree().paused= !get_tree().paused


func _on_ButtonResume_pressed():
	get_tree().paused=false
	visible = !visible
