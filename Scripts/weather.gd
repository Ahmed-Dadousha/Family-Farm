extends Control

var current_weather: String = "none" # none, rain, 


func _on_timer_timeout():
	current_weather = "rain" if current_weather == "none" else "none"
	$Timer.wait_time = randi_range(10,30)
	$Timer.start()

func _process(_delta):
	GameManager.weather = current_weather
	visible = true if current_weather == "rain" else false
