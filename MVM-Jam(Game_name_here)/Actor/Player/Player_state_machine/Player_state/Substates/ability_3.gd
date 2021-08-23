extends sub_state

const duration=0.75
const Double_jump_distance=3*64

onready var double_jump_gravity=2*(Double_jump_distance/pow(duration,2))
onready var double_jumping_speed=-sqrt(2*double_jump_gravity*Double_jump_distance)

var jump_count=0
func play_state(delta):
	if Input.is_action_pressed("Jump") && jump_count<=0:
		actor.velocity.y=double_jumping_speed
		print(double_jumping_speed)
		jump_count+=1
	actor.apply_velocity()
	if jump_count<0:
		actor.apply_gravity(delta)
	else:
		apply_gravity(delta)

func  check_exit_condition(delta):
	if actor.velocity.y>0:
		jump_count=0
		return "Fall"

func apply_gravity(delta):
	actor.velocity.y+=double_jump_gravity*delta
