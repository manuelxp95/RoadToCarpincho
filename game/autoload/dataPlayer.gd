extends Node

signal start_game

var lifes = 3 
var score = 0

func _ready():
	emit_signal("start_game")

func damage():
	lifes -= 1
	
func update_score(new_score):
	score= new_score+score
