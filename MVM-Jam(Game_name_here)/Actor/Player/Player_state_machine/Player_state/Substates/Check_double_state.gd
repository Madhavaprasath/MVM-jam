extends sub_state

const current_animtion="emit_slow_motion"
const Duration=3.0
const Strength=0.9
const dash_speed=Vector2(500,500)

signal start_slow_motion(duration,strength)

enum mode{check,apply,finished}
var current_mode=mode.check



var direction_vector=Vector2(0,0)

var animation_started=false


onready var fsm=get_parent().get_parent()


func play_state(delta):
	if current_mode==mode.check:
		if !animation_started:
			fsm.animation_player.play(current_animtion)
		direction_vector=check_movement()
	if direction_vector!=Vector2(0,0) && current_mode==mode.apply:
		actor.velocity.x=dash_speed.x*direction_vector.x
		actor.velocity.y=direction_vector.y*dash_speed.y
		current_mode=mode.finished
	actor.apply_velocity()




func  check_exit_condition(delta):
	if current_mode==mode.finished ||(current_mode==mode.apply && direction_vector==Vector2()):
		reset_variables()
		return "Fall"
	return null 
func check_movement():
	var x_direction=int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	var y_direction=-int(Input.is_action_pressed("Jump"))+int(Input.is_action_pressed("Crouch"))
	return Vector2(x_direction,y_direction)

func add_slow_motion():
	emit_signal("start_slow_motion",Duration,Strength)
	animation_started=true

func reset_variables():
	animation_started=false
	current_mode=mode.check
	direction_vector=Vector2()
