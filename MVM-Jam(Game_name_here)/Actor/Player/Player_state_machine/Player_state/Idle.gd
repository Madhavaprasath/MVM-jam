extends state



func play_state(delta):
	actor.move_player()
	actor.apply_gravity(delta)
func  check_exit_condition(delta):
	if actor.is_on_floor():
		if actor.check_movement()!=0:
			return "Run"
	elif !actor.is_on_floor():
		if actor.velocity.y<0:
			return "Jump"
		elif actor.velocity.y>0:
			return "Fall"
