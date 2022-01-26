extends Area2D

func _ready():
	$disclaimer.visible= false

func _on_Food_body_entered(body):
	$CollisionShape2D.set_deferred("disabled",true)
	DataPlayer.foodconsume()
	$AnimationPlayer.play("consume")
