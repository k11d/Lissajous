extends Control


func _ready() -> void:
    OS.set_window_title("Lissajous Figures")    
    
    
func _on_ButtonQuit_pressed() -> void:
    get_tree().quit()
