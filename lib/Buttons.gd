extends HBoxContainer

onready var menu_opened := false


func _ready() -> void:
    hide_menu()


func _on_BtnClose_pressed() -> void:
    if menu_opened:
        hide_menu()
    else:
        show_menu()

func hide_menu() -> void:
    _on_BtnClose_mouse_exited()
    $BtnX.visible = false
    $BtnY.visible = false
    $BtnC.visible = false
    $BtnClear.visible = false    
    $BtnTarget.visible = false
    self_modulate = Color(1.0, 1.0, 1.0, 0.1)
    menu_opened = false
#    $AnimationPlayer.play("MoveIn", -1, 3.0)


func show_menu() -> void:
    _on_BtnClose_mouse_entered()
    $BtnX.visible = true
    $BtnY.visible = true
    $BtnC.visible = true
    $BtnClear.visible = true
    $BtnTarget.visible = true
    modulate = Color(1.0, 1.0, 1.0, 1.0)
    menu_opened = true
#    $AnimationPlayer.play("MoveOut", -1, 3.0)



func _on_BtnClose_mouse_entered() -> void:
    if menu_opened:
        modulate = Color(1.0, 1.0, 1.0, 1.0)
    else:
        modulate = Color(1.0, 1.0, 1.0, 0.8)        


func _on_BtnClose_mouse_exited() -> void:
    if !menu_opened:
        modulate = Color(1.0, 1.0, 1.0, 0.1)

