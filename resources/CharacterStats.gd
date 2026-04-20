class_name CharacterStats extends Resource

class Ability:
	var min_modifier: float
	var max_modifier: float
	var ability_score: int = 25:
		set(value):
			ability_score = clamp(value, 0, 100)
	
	func _init(_min: float, _max: float) -> void:
		min_modifier = _min
		max_modifier = _max
	
	func percentile_lerp(min_bound: float, max_bound: float) -> float:
		return lerp(min_bound, max_bound, ability_score / 100.0)
	
	func get_modifier() -> float:
		return percentile_lerp(min_modifier, max_modifier)
	
	func increase() -> void:
		ability_score += randi_range(2, 5)


var level := 1
var xp := 0

var strenght := Ability.new(2.0, 12.0) # Damage bonus on attack.
var speed := Ability.new(3.0, 7.0) # Movement speed in m/s.
var endurance := Ability.new(5.0, 25.0) # HP bonus per level.
var agility := Ability.new(0.05, 0.25) # crit chance.

func get_base_speed() -> float:
	return speed.get_modifier()

func get_damage_modifier() -> float:
	return strenght.get_modifier()

func get_crit_chance() -> float:
	return agility.get_modifier()

func level_up() -> void:
	level += 1
	strenght.increase()
	agility.increase()
	speed.increase()
	endurance.increase()
	printt(strenght.ability_score,
		agility.ability_score,
		speed.ability_score,
		endurance.ability_score
	)
