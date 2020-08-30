extends Node2D



func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			$ComponentUI.visible = !$ComponentUI.visible
			

func _on_ComponentUI_mouse_entered():
	$ComponentUI.visible = true

func _on_ComponentUI_mouse_exited():
	$ComponentUI.visible = false


func _on_Panel_mouse_entered():
	if !$ComponentUI.visible:
		$ComponentUI.visible = true
#		$Panel.visible = false
