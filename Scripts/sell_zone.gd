extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player"):
		var carrots: int = GameManager.carrotsCount
		var onions: int = GameManager.OnionsCount
		var coins: int = GameManager.Coins
		
		coins += (carrots * 5) + (onions * 8) 
		
		GameManager.Coins = coins
		
		GameManager.carrotsCount = 0
		GameManager.OnionsCount = 0
		
