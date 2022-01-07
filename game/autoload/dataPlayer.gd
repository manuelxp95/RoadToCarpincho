extends Node

signal start_game
signal break_shield
signal equip_shield

var lifes = 3 
var score = 0
var can_take_damage= true
var can_move =true



func _ready():
	emit_signal("start_game")



func damage():
	if can_take_damage:
		can_take_damage = false
		if lifes == 4:
			emit_signal("break_shield")
		lifes -= 1
		yield(get_tree().create_timer(1.0),"timeout")
		can_take_damage = true



func foodconsume():
	if lifes == 3:
		emit_signal("equip_shield")
	lifes += 1


func update_score(new_score):
	score= new_score+score

