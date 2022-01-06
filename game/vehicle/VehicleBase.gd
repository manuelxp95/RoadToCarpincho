extends KinematicBody2D

export var vel = Vector2(-100,0)
var my_pos = Vector2.ZERO
var my_dir = 0


func _ready():
	direction()
	global_position= my_pos


func _process(_delta) -> void:
	move_and_slide(vel,Vector2.UP)
	destroy()


func create(pos,dir,rand_vel):
	my_pos = pos
	my_dir = dir
	vel = rand_vel


func direction():
	if my_dir == 1:
		my_pos.x = -20
		my_pos.y = my_pos.y
		vel.x= -(vel.x)
		self.scale.x=-(self.scale.x)


func destroy():
	if global_position.x >1000 or global_position.x < -100:
		queue_free()


func _on_body_entered(body):
	if body.get_name() == "Carpincho":
		body.damage()
