extends Area2D



func _on_Food_body_entered(body):
	$CollisionShape2D.set_deferred("disabled",true)
	DataPlayer.foodconsume()
	$AnimationPlayer.play("consume")
