 extends Node

onready var player = $Carpincho
onready var respawn_pos= $Respawn
onready var vehicles= $Vehicles
onready var powerup= $Powerup

var carpincho
var mosquito


func _ready():
	player.connect("take_damage",self,"respawn")

func _process(_delta):
	gameover()


func gameover():
	if DataPlayer.lifes == 0:
		$TopLayer/HUD.visible=false
		DataPlayer.can_move=false
		$TopLayer/GameOverScreen.visible = true



func respawn():
	player.global_position= respawn_pos.global_position
	player.animation.play("respawn")
	player.collision_active()
	yield(get_tree().create_timer(1.0),"timeout")
	DataPlayer.can_move= true
