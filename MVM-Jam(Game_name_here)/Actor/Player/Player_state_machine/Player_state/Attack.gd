extends state


var total_combo_count=3
var combo_count=0
var timer_finished=false

func play_state(delta):
	if Input.is_action_pressed("click"):
		if total_combo_count==3:
			$Timer.start(3)
	total_combo_count-=1
	#animation_player.play("Attack"+"_"+str(total_combo_count))
	

func  check_exit_condition(delta):
	if total_combo_count<=0:
		return "Idle"

