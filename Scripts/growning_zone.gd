extends Node2D

var plant: int = GameManager.planedSelected
var is_growing: bool = false
var grown: bool = false

func _physics_process(_delta):
	if !is_growing:
		plant = GameManager.planedSelected

func _on_area_2d_area_entered(_area):
	if !is_growing:
		if plant == 1:
			is_growing = true
			$carrot_grow_timer.start()
			$plant.play("carrot_growing")
		elif plant == 2:
			is_growing = true
			$onion_grow_timer.start()
			$plant.play("onion_growing")
		elif plant == 3:
			is_growing = true
			$corn_grow_timer.start()
			$plant.play("corn_growing")
			
	else:
		print("Plant is already grown here!")
		
func _on_carrot_grow_timer_timeout():
	if $plant.frame == 0:
		$plant.frame = 1
		$carrot_grow_timer.start()
	elif $plant.frame == 1:
		$plant.frame = 2
		grown = true
		
func _on_onion_grow_timer_timeout():
	if $plant.frame == 0:
		$plant.frame = 1
		$onion_grow_timer.start()
	elif $plant.frame == 1:
		$plant.frame = 2
		grown = true
		
func _on_corn_grow_timer_timeout():
	if $plant.frame == 0:
		$plant.frame = 1
		$corn_grow_timer.start()
	elif $plant.frame == 1:
		$plant.frame = 2
		grown = true
		
func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		if grown:
			if plant == 1:
				GameManager.carrotsCount += 1
				is_growing = false
				grown = false
				$plant.play("none")
			elif plant == 2:
				GameManager.onionsCount += 1
				is_growing = false
				grown = false
				$plant.play("none")
			elif plant == 3:
				GameManager.cornCount += 1
				is_growing = false
				grown = false
				$plant.play("none")


