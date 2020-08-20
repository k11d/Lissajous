extends Path2D

enum CMP {X, Y}
var offset := 0.0
var pt_position : Vector2
var x_component
var y_component
var o_component
export(CMP) var slct_component = CMP.X
export(float) var _offset_value = 0.0
onready var sprite = get_node("PathFollower/Position2D/Sprite")



func _ready() -> void:
    var p = point_position()
    x_component = p.x
    y_component = p.y
    $AnimationPlayer.play("turn")
    $XSlider.max_value = 36
    $XSlider.min_value = -$XSlider.max_value
    $YSlider.max_value = 36
    $YSlider.min_value = -$YSlider.max_value
    $PathFollower.unit_offset = _offset_value
    select_component()


func _play(anim) ->void:
    $AnimationPlayer.play(anim)
    

func _stop()->void:
    $AnimationPlayer.stop()
    $AnimationPlayer.seek(0.0)

    
func select_component():
    if slct_component == CMP.Y:
        $XSlider.visible = false
        $PathFollower.unit_offset = 0.5
        o_component = y_component
        sprite.modulate = Color(0.0, 0.3, 1.0, 1.0)
        $XSlider.visible = false
    else:
        $YSlider.visible = false
        o_component = x_component
        sprite.modulate = Color(1.0, 0.3, 0.0, 1.0)

        
func _process(delta: float) -> void:
    var p = point_position()
    x_component = p.x
    y_component = p.y
    
    var local_p = to_local(p)
    $XSlider.value = local_p.x
    $YSlider.value = -local_p.y
    $X/x.text = str(int(x_component))
    $Y/y.text = str(int(y_component))
    
    if slct_component == CMP.X:
        o_component = x_component
        $Out/out.text = "x:" + str(int(local_p.x))
    else:
        o_component = y_component
        $Out/out.text = "y:" + str(int(local_p.y))


func point_position():
    var tgt = $PathFollower/Position2D
    var trfact : Transform2D = tgt.get_global_transform()
    var tr = (trfact * tgt.position)
    $XSlider.value = tr.x
    $YSlider.value = tr.y
    $XSlider.update()
    $YSlider.update()
    return tr


func _on_XSlider_value_changed(value: float) -> void:
    if x_component:
        x_component += value
        $XSlider/XPolygon2D.position.x = value + 28
        
func _on_YSlider_value_changed(value: float) -> void:
    if y_component:
        y_component += value
        $YSlider/YPolygon2D.position.y = value        
