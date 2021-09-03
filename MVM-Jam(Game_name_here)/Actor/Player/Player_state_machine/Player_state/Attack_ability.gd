extends state




func return_path(state):
	return (str(name) + "/" + state)

func  check_exit_condition(delta):
	return return_path("ability_2")


