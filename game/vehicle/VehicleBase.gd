extends KinematicBody2D

var vel = Vector2(-100,0)
var my_pos = Vector2.ZERO
var my_dir = 0

func _ready():
	direction()
	global_position= my_pos

func _process(_delta) -> void:
	move_and_slide(vel,Vector2.UP)

func create(pos,dir):
	my_pos = pos
	my_dir = dir

func direction():
	if my_dir == 1:
		my_pos.x = -20
		my_pos.y = my_pos.y
		vel=Vector2(100,0)
		self.scale.x=-(self.scale.x)
