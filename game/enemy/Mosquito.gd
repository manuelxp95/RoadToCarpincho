extends KinematicBody2D

var can_move=true
var speed = 70.0
var direction= 1
var mypos= Vector2.ZERO
var player_pos= Vector2.ZERO
var hit= false


onready var det_player= $Animation/DetectorPlayer
onready var animation_tree= get_node("AnimationTree")
onready var state_machine


func _ready():
	state_machine= animation_tree.get("parameters/playback")


func _physics_process(delta):
	tree_control(delta)



func tree_control(delta):
	#------------------ Rotate body
	if self.global_position.x >= 700 or self.global_position.x < -10:
		rotate_body()
	if can_move:
		idle()
	else:
		attack(delta)





func rotate_body():
	direction = -direction
	det_player.scale.x = - det_player.scale.x
	animation_tree.set('parameters/idle/blend_position', direction)
	animation_tree.set('parameters/attack/blend_position', direction)


func attack(delta):
	if !hit:
		$Tween.interpolate_property(
			self,
			"global_position",
			global_position,
			player_pos,
			0.7,
			Tween.TRANS_LINEAR,
			Tween.EASE_OUT_IN
		)
		$Tween.start()
		state_machine.travel("attack")
	else:
		animation_tree.set('parameters/dead/blend_position', direction)
		state_machine.travel("dead")



func idle():
	move_and_slide(Vector2(speed*direction,0))
	state_machine.travel("idle")


func _on_DetectorPlayer_body_entered(body):
	can_move=false
	player_pos= body.get_mypos()


func _on_DetectorPlayer_body_exited(body):
	can_move=true


func _on_AreaHit_body_entered(body):
	$Animation/AreaHit/CollisionShape2D.set_deferred("disabled",true)
	can_move=false
	hit=true
	body.poison()
	
	
	
