extends state


func play_state(delta):
	actor.apply_gravity(delta)
	actor.move_player()


func  check_exit_condition(delta):
	if actor.is_on_floor():
		if actor.check_movement()==0:
			return "Idle"
	elif !actor.is_on_floor():
		if actor.velocity.y<0:
			return "Jump"
		else:
			return "Fall"
			


