extends Node

onready var player = $Carpincho
onready var respawn_pos= $Respawn

func _ready():
	player.connect("take_damage",self,"respawn")

func respawn():
	player.global_position= respawn_pos.global_position
