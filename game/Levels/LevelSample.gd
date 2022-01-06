extends Node

onready var player = $Carpincho
onready var respawn_pos= $Respawn
onready var vehicles= $Vehicles
onready var powerup= $Powerup

func _ready():
	player.connect("take_damage",self,"respawn")

#	GlobalSfx.music()

func respawn():
	player.global_position= respawn_pos.global_position
	player.collision_active()

