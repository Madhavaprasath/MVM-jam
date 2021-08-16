extends KinematicBody2D

export (int) var speed=400
export(int)  var gravity=100
var velocity=Vector2()

onready var finite_state_machine=get_node("Finite_state_machine")

func _ready():
	finite_state_machine.push_state("Idle")
	#get the stats from the player and store it in a variable
	pass







func _unhandled_key_input(event):
	if event.is_action_pressed("Jump"):
		pass