extends Control

var current_time: String = "day"

func _ready():
	if current_time == "day":
		$ColorRect.color.a = 0
	else:
		$ColorRect.color.a = 71

func _on_timer_timeout():
	change_state()
	
func change_state():
	if current_time == "night":
		$AnimationPlayer.play_backwards("Day&Night")
		await $AnimationPlayer.animation_finished
		current_time = "day"
		$Timer.wait_time = 15
	else:
		$AnimationPlayer.play("Day&Night")
		await $AnimationPlayer.animation_finished
		current_time = "night"
		$Timer.wait_time = 8
	$Timer.start()
