extends  Node2D
class_name seed_pack

var seed_type: int = 1 # 1 => Carrot 
var dragable: bool = false


func _physics_process(_delta):
	
	if dragable:
		if Input.is_action_just_pressed("click"):
			GameManager.is_dragging = true
			GameManager.planedSelected = seed_type
		if Input.is_action_pressed("click"):
			# Set the object position to mouse position
			global_position = get_global_mouse_position() 
			
		elif Input.is_action_just_released("click"):
			GameManager.is_dragging = false


func _on_area_2d_mouse_entered():
	if not GameManager.is_dragging:
		dragable = true


func _on_area_2d_mouse_exited():
	if not GameManager.is_dragging:
		dragable = false
