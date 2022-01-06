extends Node

signal start_game
signal break_shield
signal equip_shield

var lifes = 3 
var score = 0

func _ready():
	emit_signal("start_game")

func damage():
	if lifes == 4:
		emit_signal("break_shield")
	lifes -= 1

func foodconsume():
	if lifes == 3:
		emit_signal("equip_shield")
	lifes += 1
	print(lifes)


func update_score(new_score):
	score= new_score+score
