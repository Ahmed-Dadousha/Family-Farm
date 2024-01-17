extends Control

var owned: Array[String] = []

var corn = preload("res://Scenes/Statics/corn_seedpack.tscn").instantiate()
var cabbage = preload("res://Scenes/Statics/cabbage_seedpack.tscn").instantiate()
var strawberry = preload("res://Scenes/Statics/strawberry_seedpack.tscn").instantiate()

var currentItem: int = 3 # 3 => Corn # 4 Cabbage # 5 => Strawberry

func _ready():
	$Icon.play("corn")

func _process(_delta):
	
	if visible:
		if currentItem == 3:
			$Icon.play("corn")
		elif currentItem == 4:
			$Icon.play("cabbage")
		elif currentItem == 5:
			$Icon.play("strawberry")

		$buyButtonColor.visible = true if  int($Label.text) >  GameManager.Coins else false
		
		change_price()

# Signals		
func _on_buy_button_pressed():
	buy()

func _on_right_button_pressed():
	swap_item_forward()
	
func _on_left_button_pressed():
	swap_item_back()


# My Custem Functions
func swap_item_forward():
	if currentItem == 5:
		currentItem = 3
	else:
		currentItem += 1

func swap_item_back():
	if currentItem == 3:
		currentItem = 5
	else:
		currentItem -= 1

func change_price():
	if $Icon.animation == "corn":
		$Label.text = str(100)
	elif $Icon.animation == "cabbage":
		$Label.text = str(150)
	elif $Icon.animation == "strawberry":
		$Label.text = str(200)

func buy():
	GameManager.Coins -= int($Label.text)
	
	if $Icon.animation not in owned:
		if $Icon.animation  == "corn":
			add_to_root(corn)
		elif $Icon.animation  == "cabbage":
			add_to_root(cabbage)
		elif $Icon.animation  == "strawberry":
			add_to_root(strawberry)
		
func add_to_root(scene: Node2D):
	scene.global_position = Vector2(350, 50)
	get_tree().root.add_child(scene)
