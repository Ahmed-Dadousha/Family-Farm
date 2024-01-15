extends Node


var planedSelected: int = 1 # 1 => Carrots # 2 => Onion

var carrotsCount: int = 0
var OnionsCount: int = 0

func _ready():
	$AnimatedSprite2D.play("default")
