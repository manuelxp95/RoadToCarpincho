extends Area2D

var score = 1000
var next_lvl


func _ready():
	$AnimateWin.visible=false
	$AnimateWin/Camera2D.current=false

func _on_LakeWin_body_entered(body):
	DataPlayer.update_score(score)
	body.disabled()
	$AnimationWin.play("win")


func _on_TimerScore_timeout():
	score -= 50

func win():
	get_tree().change_scene("res://game/Levels/Level"+str(next_lvl)+".tscn")
