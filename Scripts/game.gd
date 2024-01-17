extends Node2D


func _ready():
	$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Counts/Carrots/CarrotText.text = str(GameManager.carrotCount)
	$Counts/Onions/OnionText.text = str(GameManager.onionCount)
	$Counts/Corns/CornText.text = str(GameManager.cornCount)
	$Counts/Cabbages/CabbageText.text = str(GameManager.cabbageCount)
	$Counts/Strawberries/StrawberryText.text = str(GameManager.strawberryCount)
	$Counts/Coins/CoinsText.text = str(GameManager.Coins)

func _on_audio_stream_player_2d_finished():
		$AudioStreamPlayer2D.play()

func _on_shop_shop_menu_hide():
	$zones/shop_menu.visible = false

func _on_shop_shop_menu_show():
	$zones/shop_menu.visible = true
