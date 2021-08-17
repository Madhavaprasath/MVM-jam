extends KinematicBody2D

export (int) var max_speed=300
export(int)  var gravity=1200
export (int) var accerleration=20
export (int) var Jump_speed=-500

var velocity=Vector2()
var direction
var snap=false
onready var finite_state_machine=get_node("Finite_state_machine")




func _ready():
	finite_state_machine.push_state("Idle")
	#get the stats from the player and store it in a variable
	pass





func check_movement():
	var movements={"left":Input.is_action_pressed("ui_left"),
					"right":Input.is_action_pressed("ui_right")}
	
	direction=int(movements["right"])-  int(movements["left"])
	return direction

func move_player(direction=check_movement()):
	
	velocity.x+=lerp(velocity.x,direction*accerleration,0.8)
	velocity.x=clamp(velocity.x,-max_speed,max_speed)
	apply_velocity()

func apply_gravity(delta):
	velocity.y+=gravity*delta


func apply_velocity():
	if Input.is_action_just_pressed("Jump") && snap:
		velocity.y=Jump_speed
		snap=false

	var snap_vector=Vector2.DOWN*32 if snap else Vector2.ZERO
	velocity=move_and_slide_with_snap(velocity,snap_vector,Vector2.UP)
	var landed=is_on_floor() and !snap
	if landed:
		snap=true

func come_to_rest():
	velocity.x=lerp(velocity.x,0.0,0.4)
	apply_velocity()
