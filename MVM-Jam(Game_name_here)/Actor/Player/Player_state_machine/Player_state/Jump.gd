extends state



func play_state(delta):
	actor.apply_gravity(delta)
	actor.move_player()

func  check_exit_condition(delta):
	if actor.velocity.y>0:
		return "Fall"
	if actor.double_jumping:
		return "Double_jump"
