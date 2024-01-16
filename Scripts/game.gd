extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Counts/Carrots/CarrotText.text = str(GameManager.carrotCount)
	$Counts/Onions/OnionText.text = str(GameManager.onionCount)
	$Counts/Corns/CornText.text = str(GameManager.cornCount)
	$Counts/Cabbages/CabbageText.text = str(GameManager.cabbageCount)
	$Counts/Coins/CoinsText.text = str(GameManager.Coins)
