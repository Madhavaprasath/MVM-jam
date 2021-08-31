extends sub_state

var bodies=[]

onready var detect_area_collision_shape:CollisionShape2D=actor.get_node("Areas/Detect_area/CollisionShape2D")
onready var detect_area:Area2D=actor.get_node("Areas/Detect_area")


func _ready():
	detect_area_collision_shape.disabled=false

func play_state(delta):
	pass

	
func  check_exit_condition(delta):
	pass


func find_smallest_distance_from_bodies(arr):
	var Smallest_distance=(arr[0]).global_position.distance_to(actor.global_position)
	var shortest_node=arr[0]
	for i in range(0,len(arr)):
		var current_distance=(arr[i]).global_position.distance_to(actor.global_position)
		if current_distance<Smallest_distance:
			shortest_node=arr[i]
	return shortest_node


func _on_Detect_area_body_entered(body):
	for i in detect_area.get_overlapping_bodies():
		bodies.append(i)
