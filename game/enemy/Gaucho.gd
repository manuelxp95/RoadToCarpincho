extends KinematicBody2D

var speed = 60
var direction= Vector2(1.0,0)
var can_move = true

onready var det_environment = $AnimatedSprite/Detector
onready var animation_tree= get_node("AnimationTree")
onready var state_machine

func _ready():
	state_machine =animation_tree.get("parameters/playback")

func _process(delta):
	tree_control()

func tree_control():
	if det_environment.is_colliding():
		can_move= false
		state_machine.travel("idle")
		move_and_slide(Vector2(0,0))
		direction = -direction
		speed = -speed
		det_environment.scale.x=-(det_environment.scale.x)
		yield(get_tree().create_timer(1.0),"timeout")
		can_move=true
		state_machine.travel("walk")
	walk(speed)
		

func walk(sp):
	if can_move:
		move_and_slide(Vector2(sp,0))
		animation_tree.set('parameters/idle/blend_position', direction)
		animation_tree.set('parameters/walk/blend_position', direction)
		state_machine.travel("walk")

func run():
	move_and_slide(Vector2(speed*2,0))
	state_machine.travel("run")

func attack():
	state_machine.travel("attack")
