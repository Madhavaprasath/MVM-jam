extends Node2D


var total_abilities={
	"Ability_1":{
		"Ability_name":"Double_jump"
	},
	"Ability_2":{
		"Ability_name":"Double_jump_and_direction",
		"direction_vector":Vector2(0,0),
		"direction_push_speed":Vector2(250,250)
	}
}


var current_ability



func _ready():
	current_ability=get_ability("Ability_2")
	
	
func get_ability(key):
	return total_abilities[key]
