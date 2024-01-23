extends Node

signal weather_changed
signal stats_changed

var planedSelected: int = 0 # 1 => Carrot # 2 => Onion # 3 => Corn # 4 Cabbage # 5 => Strawberry

#  CROPS
var carrotCount: int = 0
var onionCount: int = 0
var cornCount: int = 0
var cabbageCount: int = 0
var strawberryCount: int = 0

var Coins: int = 0
var is_dragging: bool = false

var weather: String:
	set(value):
		weather = value
		stats_changed.emit()
