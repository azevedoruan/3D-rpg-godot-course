extends Control

@onready var target: HScrollBar = $Target
@onready var follower_1: HScrollBar = $Follower1
@onready var follower_2: HScrollBar = $Follower2


# By processed in the most fps possible
func _process(_delta: float) -> void:
	follower_1.value = lerp_function(follower_1.value, target.value, _delta)


# By processed 60 fps
func _physics_process(_delta: float) -> void:
	follower_2.value = lerp_function(follower_2.value, target.value, _delta)


func lerp_function(a: float, b: float, t: float) -> float:
	return a + (b - a) * t
