extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Counts/Carrots/CarrotText.text = str(GameManager.carrotsCount)
	$Counts/Onions/OnionText.text = str(GameManager.OnionsCount)
