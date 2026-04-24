class_name HealthComponent extends Node


signal defeat()
signal health_changed()


var max_health: float
var current_health: float:
	set(value):
		current_health = max(value, 0.0)
		if current_health == 0.0:
			defeat.emit()
		health_changed.emit()
	get:
		return current_health


func update_max_health(max_hp_in: float) -> void:
	max_health = max_hp_in
	current_health = max_health # rule is update the hp when updated the max


func take_damage(damage_in: float, is_critical: bool) -> void:
	var damage: float = damage_in
	if is_critical:
		damage *= 2.0
		print("critical! ", damage)
	current_health -= damage
