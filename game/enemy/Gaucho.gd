extends KinematicBody2D

var speed = 60
var direction= Vector2(1.0,0)
var can_move = true

onready var det_environment = $AnimatedSprite/Detector
onready var det_player = $AnimatedSprite/DetectorPlayer
onready var animation_tree= get_node("AnimationTree")
onready var state_machine

func _ready():
	state_machine =animation_tree.get("parameters/playback")

func _process(delta):
	tree_control()

#--------------Control of movement
func tree_control():
	#------------------- Dont view player
	if det_environment.is_colliding() && !det_player.is_colliding():
		can_move= false
		state_machine.travel("idle")
		move_and_slide(Vector2(0,0))
		#------------- Rotate body
		direction = -direction
		speed = -speed
		det_environment.scale.x=-(det_environment.scale.x)
		det_player.scale.x=-(det_player.scale.x)
		$AreaHit/AttackRange.position.x= -$AreaHit/AttackRange.position.x
		
		yield(get_tree().create_timer(1.0),"timeout")
		can_move=true
		state_machine.travel("walk")
	
	#---------------- View the player
	if det_player.is_colliding():
		can_move= false
		run(speed)
		if det_environment.is_colliding():
			attack()
	else:
		can_move=true
	
	walk(speed)

func walk(sp):
	if can_move:
		move_and_slide(Vector2(sp,0))
		animation_tree.set('parameters/idle/blend_position', direction)
		animation_tree.set('parameters/walk/blend_position', direction)
		state_machine.travel("walk")

func run(sp):
	animation_tree.set('parameters/run/blend_position', direction)
	move_and_slide(Vector2(sp*1.6,0))
	state_machine.travel("run")

func attack():
	animation_tree.set('parameters/attack/blend_position', direction)
	move_and_slide(Vector2(0,0))
	state_machine.travel("attack")


func _on_AreaHit_body_entered(body):
	if body.get_name() == "Carpincho":
		body.collision.set_deferred("disabled",true)
		body.damage()