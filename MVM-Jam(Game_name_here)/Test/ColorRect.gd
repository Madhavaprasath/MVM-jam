extends ColorRect
const DURATION=3000
var is_active=false
var time_start
func _on_Slowmotion_blur_screen():
	time_start=OS.get_ticks_msec()
	material.set_shader_param("blur",1)
	is_active=true

func _process(delta):
	if is_active:
		var current_time=OS.get_ticks_msec()-time_start
		var value=circle_ease_in(current_time,1,0,DURATION)
		if current_time>=DURATION:
			value=0
			is_active=false
		material.set_shader_param("blur",value)



func circle_ease_in(t,b,c,d):
	t/=d
	return -c * (sqrt(1-t*t)-1)+b
