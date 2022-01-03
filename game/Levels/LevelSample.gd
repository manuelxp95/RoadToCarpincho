extends Node

onready var player = $Carpincho
onready var respawn_pos= $Respawn
onready var vehicles= $Vehicles
onready var powerup= $Powerup

func _ready():
	player.connect("take_damage",self,"respawn")
	powerup.connect("consume",self,"slowtime")
#	GlobalSfx.music()

func respawn():
	player.global_position= respawn_pos.global_position

#func slowtime():
#	vehicles.vel= Vector2(-10,0)
