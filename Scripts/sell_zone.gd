extends Area2D


func _on_body_entered(body):
	if body.is_in_group("player"):
		var carrots: int = GameManager.carrotCount
		var onions: int = GameManager.onionCount
		var corns: int = GameManager.cornCount
		var cabbages: int = GameManager.cabbageCount
		
		var coins: int = GameManager.Coins

		coins += (carrots * 5) + (onions * 8) + (corns * 11) + (cabbages * 14)
		
		GameManager.Coins = coins
		
		GameManager.carrotCount = 0
		GameManager.onionCount = 0
		GameManager.cornCount = 0
		GameManager.cabbageCount = 0
