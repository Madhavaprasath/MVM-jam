extends Node
class_name Finite_state_machine


var previous_state
var current_state
var stack=[]


onready var parent=get_parent()


func _physics_process(delta):
	current_state=get_currentstate()
	if current_state!=null:
		var state=get_node(current_state)
		state.play_state(delta)
		var next_state=state.check_exit_condition(delta)
		if next_state!=null:
			previous_state=pop_state()
			push_state(next_state)
		

func pop_state():
	return stack.pop_front()

func push_state(state):
	stack.push_front(state)



func get_currentstate():
	return stack[len(stack)-1] if len(stack)>0 else null
