extends Area2D



func _on_Food_body_entered(body):
	DataPlayer.foodconsume()
	$AnimationPlayer.play("consume")
