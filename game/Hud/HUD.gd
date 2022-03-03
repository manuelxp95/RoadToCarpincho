extends Control

func _ready():
	$CornerLeft/Life4.visible= false
# warning-ignore:return_value_discarded
	DataPlayer.connect("start_game",self,"initial_hud")
# warning-ignore:return_value_discarded
	DataPlayer.connect("break_shield",self,"shield_break")
# warning-ignore:return_value_discarded
	DataPlayer.connect("equip_shield",self,"shield_equip")

# warning-ignore:unused_argument
func _process(delta):
	update_hud()


func initial_hud():
	for i in $CornerLeft.get_children():
		i.self_modulate ="#ffffff"

func update_hud()->void:
	var lifes= DataPlayer.lifes
	$CornerRigth/ScoreText.text ="Score: %s" %DataPlayer.score
	match lifes:
		4:
			$CornerLeft/Life4.visible= true
			$CornerLeft/Life3.self_modulate="#ffffff"
			$CornerLeft/Life2.self_modulate="#ffffff"
			$CornerLeft/Life1.self_modulate="#ffffff"
		3:$CornerLeft/Life4.visible= false
		2:
			$CornerLeft/Life4.visible= false
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#ffffff"
			$CornerLeft/Life1.self_modulate="#ffffff"
		1:
			$CornerLeft/Life4.visible= false
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#000000"
			$CornerLeft/Life1.self_modulate="#ffffff"
			
		0:
			$CornerLeft/Life4.visible= false
			$CornerLeft/Life3.self_modulate="#000000"
			$CornerLeft/Life2.self_modulate="#000000"
			$CornerLeft/Life1.self_modulate="#000000" #GAME OVER

func shield_break():
	$ShieldBreak.play()

func shield_equip():
	$ShieldEquip.play()
