extends Node2D
class_name Tracer, "res://assets/images/dot.png"


# default values
const _x_radius := 200
const _y_radius := 200
const _x_theta := PI
const _y_theta := PI
const _x_theta_offset := 0.0
const _y_theta_offset := 0.0
const _x_speed := 1.0
const _y_speed := 1.0

onready var xy : Node2D = $XY
onready var xcomp : Node2D = $XComp
onready var ycomp : Node2D = $YComp
onready var tracer : Position2D = $Pen
onready var trace : Line2D = $TraceLine

export(Vector2) var xy_node_offset := Vector2.ZERO
export(float) var x_radius
export(float) var y_radius
export(float) var x_theta
export(float) var y_theta
export(float) var x_theta_offset
export(float) var y_theta_offset
export(float) var x_speed
export(float) var y_speed


func _ready() -> void:
    xy_node_offset = OS.get_window_size() / 4
    _on_RadiusReset_pressed()
    _on_ThetaReset_pressed()
    _on_SpeedReset_pressed()

func _physics_process(delta: float) -> void:
    var px = polar2cartesian(x_radius, x_theta).x
    var py = polar2cartesian(y_radius, y_theta).y
    if x_theta_offset:
        x_theta += x_theta_offset
        x_theta_offset = 0
    if y_theta_offset:
        y_theta += y_theta_offset
        y_theta_offset = 0
    
    x_theta += x_speed * delta
    y_theta += y_speed * delta
    
    var point = Vector2(px + xy_node_offset.x, py + xy_node_offset.y)
#    var point_i = Vector2(int(px + xy_node_offset.x), int(py + xy_node_offset.y))
#    var float_int_ratio = point_i / point
#    print(float_int_ratio)
    
    $XComp/Sprite.position.x = point.x
    $YComp/Sprite.position.y = point.y
    tracer.position = point
    $Pen/LabelX.text = "X:" + str(point.x)
    $Pen/LabelY.text = "Y:" + str(point.y)
    if !(point in trace.points):
        trace.add_point(point)

func _on_XSpeed_value_changed(value: float) -> void:
    x_speed = value

func _on_YSpeed_value_changed(value: float) -> void:
    y_speed = value

func _on_XTheta_value_changed(value: float) -> void:
    x_theta_offset = value

func _on_YTheta_value_changed(value: float) -> void:
    y_theta_offset = value
    
func _on_XRadius_value_changed(value: float) -> void:
    x_radius = value

func _on_YRadius_value_changed(value: float) -> void:
    y_radius = value

func _on_RadiusReset_pressed() -> void:
    x_radius = _x_radius
    y_radius = _y_radius

func _on_ThetaReset_pressed() -> void:
    x_theta = _x_theta
    y_theta = _y_theta

func _on_SpeedReset_pressed() -> void:
    x_speed = _x_speed
    y_speed = _y_speed

func _on_ClearTrace_pressed() -> void:
    trace.clear_points()


func _on_MenuButton_pressed() -> void:
    for n in $HUD.get_children():
        n.visible = !n.visible
    $HUD/MenuButton.visible = true
    if $HUD/CloseButton.visible:
        $HUD/MenuButton.text = "^-Menu-^"
    else:
        $HUD/MenuButton.text = "v-Menu-v"
    
