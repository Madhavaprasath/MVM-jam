extends state

export(NodePath) var stats_path
onready var stats=get_node(stats_path)



func  check_exit_condition(delta):
	return return_path("check_double_jump")

func return_path(state):
	return (str(name) + "/" + state)

