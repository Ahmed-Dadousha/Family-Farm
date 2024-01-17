extends CharacterBody2D

var eating: bool = false
var walking: bool = false
var speed: int = 5
var xdir: int = 1 #1 right #-1 left
var ydir: int = 1 #-1 up #1 down 
var current_move: int = 1 #1 Horizontal  #2 Vertical


func _ready():
	
	var rand: int = randi_range(1,2)
	
	if rand > 1.5:
		walking = true
	else:
		eating = true
	startTimer($timers/walking_timer)
	startTimer($timers/state_timer)
	
func _process(delta):
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
			
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		xdir *= -1
		ydir *= -1
		startTimer($timers/walking_timer)
func _on_walking_timer_timeout():
	
	var x = randi_range(1,2)
	var y = randi_range(1,2)
	
	xdir = 1 if x > 1.5 else -1
	ydir = -1 if y > 1.5 else 1
	
	startTimer($timers/walking_timer)
	
func _on_state_timer_timeout():
	if walking:
		walking= false
		eating = true
	elif eating:
		eating = false
		walking = true
		
	startTimer($timers/state_timer)

func startTimer(timer: Timer):
	timer.wait_time = randi_range(1,6)
	timer.start()
