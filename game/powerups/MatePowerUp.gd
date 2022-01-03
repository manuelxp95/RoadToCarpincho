extends Area2D

signal consume

func _on_MatePowerUp_body_entered(body):
	body.mate_powerup()
	$SlowTime.start()
	emit_signal("consume")
	$MateAnimation.play("consume")


