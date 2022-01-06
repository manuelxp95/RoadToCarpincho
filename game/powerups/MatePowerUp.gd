extends Area2D

var score_4_mate = 150

func _on_MatePowerUp_body_entered(body):
	DataPlayer.update_score(score_4_mate)
	body.mate_powerup()
	$SlowTime.start()
	GlobalSfx.slowmusic()
	$MateAnimation.play("consume")


