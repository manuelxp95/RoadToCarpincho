extends Area2D

var score = 1000

func _ready():
	pass 

func _on_LakeWin_body_entered(body):
	DataPlayer.update_score(score)
	body.disabled()
	$AnimationWin.play("win")
	print("win")


func _on_TimerScore_timeout():
	score -= 50
