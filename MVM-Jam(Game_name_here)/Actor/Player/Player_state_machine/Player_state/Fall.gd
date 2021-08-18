extends state



func play_state(delta):
	actor.apply_gravity(delta)
	actor.move_player()

func  check_exit_condition(delta):
	if actor.is_on_floor():
		return "Idle"
