extends KinematicBody2D


const MAX_JUMP_DISTANCE=2*64
const MIN_JUMP_DISTANCE=0.5*64




export (int) var max_speed=400
export (int) var accerleration=20
export (int) var Jump_speed=-750



var velocity=Vector2()
var direction:int = 0
var snap:bool = false
var jump_duration:float = 0.5
var curve_time:float = 0
var jump_count:int = 0 
var double_jumping:bool
var invisible=false

onready var finite_state_machine=get_node("Finite_state_machine")

onready var gravity=2*(MAX_JUMP_DISTANCE/pow(jump_duration,2))
onready var max_jump_velocity=-sqrt(2*gravity*MAX_JUMP_DISTANCE)
onready var min_jump_velocity=-sqrt(2*gravity*MIN_JUMP_DISTANCE)
onready var animation_player=get_node("Body/AnimationPlayer")

func _ready():
	finite_state_machine.push_state("Idle")
	print(gravity,max_jump_velocity,min_jump_velocity)

func check_movement():
	var movements:Dictionary={"left":Input.is_action_pressed("ui_left"),"right":Input.is_action_pressed("ui_right")}
	direction=int(movements["right"])-  int(movements["left"])
	return direction

func move_player():
	velocity.x=lerp(velocity.x,direction*max_speed,0.2)
	apply_velocity()

func apply_gravity(delta):
	velocity.y+=gravity*delta

func apply_velocity():
	var snap_vector=Vector2.DOWN*32 if snap else Vector2.ZERO
	velocity=move_and_slide_with_snap(velocity,snap_vector,Vector2.UP)
	var landed=is_on_floor() and !snap
	if landed:
		snap=true
		jump_count=0
		double_jumping=false


func _unhandled_input(event):
	if event.is_action_pressed("Jump"):
		if snap && is_on_floor() && jump_count<1:
			jump_count=1
			velocity.y=max_jump_velocity
			snap=false
		elif jump_count==1:
			double_jumping=true
	if event.is_action_released("Jump") && velocity.y<min_jump_velocity:
		velocity.y=min_jump_velocity
