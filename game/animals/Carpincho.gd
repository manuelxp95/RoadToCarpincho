extends KinematicBody2D

#-------------------- Global Variables

export var vel = Vector2(150.0,150.0)

#-------------------- Local Variables

var mov= Vector2.ZERO
var can_move= true

#-------------------- Node variables

onready var animation= $AnimationPlayer
onready var carpincho_sprite=$CarpinchoSprite


func _physics_process(_delta):
	mov.x= vel.x * direction_input().x
	mov.y= vel.y * direction_input().y
	move_and_slide(mov,Vector2.UP)


#-------------------- Functions carpincho

func direction_input() -> Vector2:
	var dir= Vector2.ZERO
	if can_move:
		dir.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
		dir.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
		if dir == Vector2.ZERO:
			animation.play("idle")
		else: 
			if dir.x < 0:
				carpincho_sprite.flip_h = true
				animation.play("walk_side")
			elif dir.x > 0:
				carpincho_sprite.flip_h = false
				animation.play("walk_side")
			elif dir.y < 0:
				animation.play("walk_front")
			else:
				animation.play("walk_back")
	return dir
