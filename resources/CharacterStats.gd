class_name CharacterStats extends Resource

class Ability:
	var min_modifier: float
	var max_modifier: float
	
	func _init(_min: float, _max: float) -> void:
		min_modifier = _min
		max_modifier = _max
		
	var ability_score: int = 25:
		set(value):
			ability_score = clamp(value, min_modifier, max_modifier)


var level := 1
var xp := 0

var strenght
var speed := Ability.new(3.0, 7.0)
var endurance
var agility
