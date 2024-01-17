extends CharacterBody2D

var eating: bool = false
var walking: bool = false
var speed: int = 5
var xdir: int = 1 #1 right #-1 left
var ydir: int = 1 #-1 up #1 down 
var current_move: int = 1 #1 Horizontal  #2 Vertical


func _ready():
	walking = true
func _process(_delta):
	if eating:
		current_move = 2 if randi_range(1,2) > 1.5 else 1
		velocity = Vector2(0,0)
		$AnimatedSprite2D.play("eating")
		
	if walking:
		$AnimatedSprite2D.play("walking")
		if current_move == 1:
			$AnimatedSprite2D.flip_h = true if xdir == -1 else false
			velocity = Vector2(speed * xdir,0)
		else:
			velocity = Vector2(0, speed * ydir)
	move_and_slide()


func _on_walking_timer_timeout():
	
	var x = randi_range(1,2)
	var y = randi_range(1,2)
	
	xdir = 1 if x > 1.5 else -1
	ydir = -1 if y > 1.5 else 1
	
	$timers/walking_timer.wait_time = randi_range(1,4)
	$timers/walking_timer.start()
	
func _on_state_timer_timeout():
	if walking:
		walking= false
		eating = true
	elif eating:
		eating = false
		walking = true
		
	$timers/state_timer.wait_time = randi_range(2,6)
	$timers/state_timer.start()
