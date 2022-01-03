extends KinematicBody2D

#-------------------- Signals
signal take_damage()

#-------------------- Global Variables

export var vel = Vector2(960.0,960.0)

#-------------------- Local Variables
const vel_const = Vector2(960.0,960.0)

var mov= Vector2.ZERO
var can_move= true
var lvl_spawn = Vector2(0,0)
var sprite_sit=false

#-------------------- Node variables

onready var animation= $AnimationPlayer
onready var carpincho_sprite=$CarpinchoSprite
onready var t_standby=$TimerStandby


func _ready() -> void:
	$SlowTime.visible=false
	$Camera2D/PoweUp/VBoxContainer.visible=false


func _physics_process(_delta):
	check_speed()
	mov.x= vel.x * direction_input().x
	mov.y= vel.y * direction_input().y
	move_and_slide(mov,Vector2.UP)



#--------------- Only standby control
func _input(event):
	if event is InputEventKey:
		t_standby.start()
		sprite_sit = false



#-------------------- Functions carpincho

func direction_input() -> Vector2:
	var dir= Vector2.ZERO
	if can_move:
		dir = dir_input(dir)
		if dir.x < 0:
			carpincho_sprite.flip_h = true
			animation.play("walk_side")
		elif dir.x > 0:
			carpincho_sprite.flip_h = false
			animation.play("walk_side")
		elif dir.y < 0:
			animation.play("walk_front")
		elif dir.y > 0:
			animation.play("idle")
	return dir


func dir_input(direction:Vector2) -> Vector2:
	if Input.is_action_just_pressed("ui_right"): 
		direction.x =1
	elif Input.is_action_just_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_just_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_just_pressed("ui_up"): 
		direction.y = -1
	return direction


func damage():
	#animation.play("damage")
	emit_signal("take_damage")
	DataPlayer.damage()

func mate_powerup():
	$Camera2D/PoweUp/AnimationPower.play("slowtime")

# standby controler
func _on_TimerStandby_timeout():
	sprite_sit=true
	animation.stop()
	animation.play("await")
	yield(get_tree().create_timer(3.5),"timeout")
	animation.play("sit")

func check_speed() -> void:
	var current_time= Engine.time_scale
	if current_time != 1.0:
		vel = vel_const * 10
	else:
		vel = vel_const
