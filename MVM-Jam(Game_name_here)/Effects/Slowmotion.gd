extends Node

signal blur_screen()

const End_value = 1

var is_active:bool
var time_start:int
var duration_in_ms:int
var start_value:float
var current_node:Node
func _ready():
	for nodes in get_tree().get_nodes_in_group("Slowmotion"):
		nodes.connect("start_slow_motion",self,"start_slow_motion",[nodes])

func start_slow_motion(duration = 3, strength = 0.8,nodes=self):
	time_start = OS.get_ticks_msec()
	duration_in_ms = duration*1000
	start_value = 1-strength
	Engine.time_scale = start_value
	is_active = true
	emit_signal("blur_screen")
	current_node=nodes
func _physics_process(delta):
	if is_active:
		var current_time:int = OS.get_ticks_msec()-time_start
		var value:float = circle_ease_in(current_time,start_value,End_value,duration_in_ms)
		if current_time >= duration_in_ms:
			value = End_value
			is_active = false
			if current_node.is_in_group("State"):
				current_node.current_mode=current_node.mode.apply
		Engine.time_scale=value

func circle_ease_in(t,b,c,d):
	t/=d
	return -c * (sqrt(1-t*t)-1)+b
