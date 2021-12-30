extends Area2D



func _on_MatePowerUp_body_entered(body):
	$MateAnimation.play("consume")

