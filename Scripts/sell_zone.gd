extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player"):
		var carrots: int = GameManager.carrotsCount
		var onions: int = GameManager.onionsCount
		var corn: int = GameManager.cornCount
		var coins: int = GameManager.Coins
		
		coins += (carrots * 5) + (onions * 8) + (corn * 11)
		
		GameManager.Coins = coins
		
		GameManager.carrotsCount = 0
		GameManager.onionsCount = 0
		GameManager.cornCount = 0
