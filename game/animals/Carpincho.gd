extends KinematicBody2D

#-------------------- Señales
signal take_damage()

#-------------------- Global Variables

export var vel = Vector2(150.0,150.0)

#-------------------- Local Variables

var mov= Vector2.ZERO
var can_move= true
var lvl_spawn = Vector2(0,0)
var sprite_sit=false

#-------------------- Node variables

onready var animation= $AnimationPlayer
onready var carpincho_sprite=$CarpinchoSprite
onready var t_standby=$TimerStandby


func _physics_process(_delta):
	mov.x= vel.x * direction_input().x
	mov.y= vel.y * direction_input().y
	move_and_slide(mov,Vector2.UP)

func _input(event):
	if event is InputEventKey:
		t_standby.start()
		sprite_sit = false



#-------------------- Functions carpincho

func direction_input() -> Vector2:
	var dir= Vector2.ZERO
	if can_move:
		dir.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
		dir.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
		if dir == Vector2.ZERO:
			if !sprite_sit:
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



func damage():
	#animation.play("damage")
	emit_signal("take_damage")


# standby controler
func _on_TimerStandby_timeout():
	sprite_sit=true
	animation.stop()
	animation.play("await")
	yield(get_tree().create_timer(3.5),"timeout")
	animation.play("sit")
