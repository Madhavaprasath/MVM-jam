extends sub_state

const jump_speed=-500
signal spwan_bullet(bullet,position)
var shot=false
var jump_count=0

func play_state(delta):
	if Input.is_action_pressed("Jump") && jump_count<=0:
		actor.velocity.y=jump_speed
		jump_count+=1
	actor.apply_velocity()
	actor.apply_gravity(delta)

func check_exit_condition(delta):
	if actor.velocity.y>0:
		shot=false
		jump_count=0
		return "Fall"


func _unhandled_input(event):
	if event.is_action_pressed("click") && !shot:
		print("Shot")
		emit_signal("spwan_bullet",actor.bullet,(actor.global_position+Vector2(0,64)))
		shot=true
