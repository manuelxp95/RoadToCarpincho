extends Control

func _ready():
	DataPlayer.connect("start_game",self,"initial_hud")

func _process(delta):
	update_hud()

func initial_hud():
	for i in $CornerLeft.get_children():
		i.self_modulate ="#ffffff"

func update_hud()->void:
	var lifes= DataPlayer.lifes
	$CornerRigth/ScoreText.text ="Score: %s" %DataPlayer.score
	match lifes:
		4:pass #SHIELD
		3:pass
		2:
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#ffffff"
			$CornerLeft/Life1.self_modulate="#ffffff"
		1:
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#000000"
			$CornerLeft/Life1.self_modulate="#ffffff"
			
		0:
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#000000"
			$CornerLeft/Life1.self_modulate="#000000" #GAME OVER


