extends Node2D

var plant: int = GameManager.planedSelected
var is_growing: bool = false
var grown: bool = false

func _ready():
	$plant.play("none")

func _physics_process(_delta):
	if !is_growing:
		plant = GameManager.planedSelected

func _on_area_2d_area_entered(_area):
	if !is_growing:
		if plant == 1:
			play_anim($Timers/carrot_grow_timer, "carrot_growing")
		elif plant == 2:
			play_anim($Timers/onion_grow_timer, "onion_growing")
		elif plant == 3:
			play_anim($Timers/corn_grow_timer, "corn_growing")
		elif plant == 4:
			play_anim($Timers/cabbage_grow_timer, "cabbage_growing")
		elif plant == 5:
			play_anim($Timers/strawberry_grow_timer, "strawberry_growing")
			
		is_growing = true
		$CPUParticles2D.emitting = true
		
	else:
		print("Plant is already grown here!")
		
func _on_carrot_grow_timer_timeout():
	change_frame($Timers/carrot_grow_timer)
		
func _on_onion_grow_timer_timeout():
	change_frame($Timers/onion_grow_timer)
		
func _on_corn_grow_timer_timeout():
	change_frame($Timers/corn_grow_timer)

func _on_cabbage_grow_timer_timeout():
	change_frame($Timers/cabbage_grow_timer)

func _on_strawberry_grow_timer_timeout():
	change_frame($Timers/strawberry_grow_timer)
		
func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		if grown:
			if plant == 1:
				GameManager.carrotCount += 1
			elif plant == 2:
				GameManager.onionCount += 1
			elif plant == 3:
				GameManager.cornCount += 1
			elif plant == 4:
				GameManager.cabbageCount += 1
			elif plant == 5:
				GameManager.strawberryCount += 1
				
			is_growing = false
			grown = false
			$plant.play("none")

func change_frame(timer: Timer):
	if $plant.frame == 0:
		$plant.frame = 1
		timer.start()
	elif $plant.frame == 1:
		$plant.frame = 2
	grown = true

func play_anim(timer: Timer, anim: String):
	timer.start()
	$plant.play(anim)
