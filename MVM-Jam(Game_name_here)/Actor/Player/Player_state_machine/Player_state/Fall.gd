extends state

onready var fsm=actor.get_node("Finite_state_machine")

func play_state(delta):
	actor.apply_gravity(delta)
	if fsm.previous_state!="Double_jump/ability_2":
		actor.move_player()
	else:
		actor.velocity=actor.move_and_slide(actor.velocity,Vector2.UP)

func  check_exit_condition(delta):
	if actor.is_on_floor():
		return "Idle"


