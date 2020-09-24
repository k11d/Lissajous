extends VBoxContainer


func _on_CloseButton_pressed() -> void:
    get_parent().queue_free()
