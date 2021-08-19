extends sub_state

var button_pressed=false
var direction_vector=Vector2(0,0)

var started=false
var finished=false

func play_state(delta):
	if !started:
		actor.emit_signal("start_slow_motion",3,0.8)
		started=true
	actor.apply_velocity()

func  check_exit_condition(delta):
	pass

func check_movement():
	var x_direction=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	var y_direction=int(Input.is_action_pressed("Jump"))-int(Input.is_action_pressed("Crouch"))
	return Vector2(x_direction,y_direction)
