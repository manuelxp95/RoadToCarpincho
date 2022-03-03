extends Node

const END_VALUE = Engine.time_scale

var time_start: float
var duration_ms: float
var start_value: float

var is_active= false

func start(duration= 5, strength= 0.9 ):
	time_start=OS.get_ticks_msec()
	duration_ms= duration*1000
	start_value=1-strength;
	Engine.time_scale=start_value
	is_active=true

# warning-ignore:unused_argument
func _process(delta):
	if is_active:
		var current_time =OS.get_ticks_msec()-time_start
# warning-ignore:unused_variable
		var value = easeInCubic(current_time,start_value,END_VALUE,duration_ms)
		if current_time >= duration_ms:
			is_active =false
			value= END_VALUE
			GlobalSfx.normalmusic()
			Engine.time_scale=END_VALUE



func easeInCubic(t,b,c,d):
	t/=d
	return c*t*t*t + b
	
