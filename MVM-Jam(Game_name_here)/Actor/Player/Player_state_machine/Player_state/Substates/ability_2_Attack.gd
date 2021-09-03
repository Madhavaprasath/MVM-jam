extends sub_state

signal start_slow_motion(duration,strength)


var bodies=[]
var finished=false
var shortest_entity_info
var attack_speed=500
var apply_velocity=false

onready var detect_area_collision_shape:CollisionShape2D=actor.get_node("Areas/Detect_area/CollisionShape2D")
onready var detect_area:Area2D=actor.get_node("Areas/Detect_area")


func play_state(delta):
	if actor.activate_attack_ability:
		detect_area_collision_shape.disabled=false
		finished=false
		if bodies!=[]:
			shortest_entity_info=find_smallest_distance_from_bodies(bodies)	
	else:
		detect_area_collision_shape.disabled=true
		if shortest_entity_info!=null:
			#you gotta teleport towards the body then you need to play kill and emit signal 
			#from that side
			var start_position=actor.global_position
			var end_position=shortest_entity_info.global_position+Vector2(64,0)
			var time_taken=abs((end_position.x-start_position.x)/attack_speed)
			emit_signal("start_slow_motion",(1+time_taken),0.9)
			apply_velocity=true
			$Timer.start(time_taken)
		if apply_velocity:
			actor.velocity=Vector2(attack_speed,0)
			actor.velocity=actor.move_and_slide(actor.velocity,Vector2.UP)

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


func _on_Timer_timeout():
	apply_velocity=false
