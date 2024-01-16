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
			$carrot_grow_timer.start()
			$plant.play("carrot_growing")
		elif plant == 2:
			$onion_grow_timer.start()
			$plant.play("onion_growing")
		elif plant == 3:
			$corn_grow_timer.start()
			$plant.play("corn_growing")
		elif plant == 4:
			$cabbage_grow_timer.start()
			$plant.play("cabbage_growing")
		elif plant == 5:
			$strawberry_grow_timer.start()
			$plant.play("strawberry_growing")
			
		is_growing = true
	else:
		print("Plant is already grown here!")
		
func _on_carrot_grow_timer_timeout():
	change_frame($carrot_grow_timer)
		
func _on_onion_grow_timer_timeout():
	change_frame($onion_grow_timer)
		
func _on_corn_grow_timer_timeout():
	change_frame($corn_grow_timer)

func _on_cabbage_grow_timer_timeout():
	change_frame($cabbage_grow_timer)

func _on_strawberry_grow_timer_timeout():
	change_frame($strawberry_grow_timer)
		
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
