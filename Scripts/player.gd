extends CharacterBody2D

const SPEED: int = 100

func _physics_process(_delta):
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("SideWalk")
		velocity.x = -SPEED
		velocity.y = 0
		$AnimatedSprite2D.play("SideWalk")
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("SideWalk")
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("UpWalk")
		velocity.y = -SPEED
		velocity.x = 0
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("DownWalk")
		velocity.y = SPEED	
		velocity.x = 0
	else:
		$AnimatedSprite2D.play("Idle")
		velocity = Vector2(0,0)
	move_and_slide()
