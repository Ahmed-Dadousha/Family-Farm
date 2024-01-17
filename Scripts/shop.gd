extends StaticBody2D

signal shop_menu_show
signal shop_menu_hide

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		shop_menu_show.emit()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		shop_menu_hide.emit()
