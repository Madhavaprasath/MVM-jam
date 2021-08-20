extends Node

const End_value = 1

var is_active:bool
var time_start:int
var duration_in_ms:int
var start_value:float

func start_slow_motion(duration = 3, strength = 0.8):
	time_start = OS.get_ticks_msec()
	duration_in_ms = duration*1000
	start_value = 1-strength
	Engine.time_scale = start_value
	is_active = true

func _physics_process(delta):
	if is_active:
		var current_time:int = OS.get_ticks_msec()-time_start
		var value:float = circle_ease_in(current_time,start_value,End_value,duration_in_ms)
		if current_time >= duration_in_ms:
			value = End_value
			is_active = false
		Engine.time_scale=value

func circle_ease_in(t,b,c,d):
	t/=d
	return -c * (sqrt(1-t*t)-1)+b
