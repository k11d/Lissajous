extends Node2D


onready var xcomp := $X
onready var ycomp := $Y
onready var output : Vector2

var theta_y : float = 0.0
var theta_x : float = 0.0
export(float, 0.0, 6.28, 0.01) var x_off := 0.0 setget update_x_offset
export(float, 0.0, 6.28, 0.01) var y_off := 0.0 setget update_y_offset
export(float, 0.0, 1.0, 0.001) var x_increment := 0.05 setget update_x_increment
export(float, 0.0, 1.0, 0.001) var y_increment := 0.05 setget update_y_increment


func _process(_delta: float) -> void:
    theta_x += x_increment
    theta_y += y_increment


func update_x_increment(x):
    x_increment = x
    return x_increment

func update_y_increment(y):
    y_increment = y
    return y_increment

func update_x_offset(v):
    x_off = v
    theta_x += x_off
    return x_off
    
func update_y_offset(v):
    y_off = v
    theta_y += y_off
    return y_off


func get_component(radius : float = 1.0) -> Vector2:
    theta_x += x_increment
    theta_y += y_increment
    var pos_x := polar2cartesian(radius, theta_x)
    var pos_y := polar2cartesian(radius, theta_y)
    position += Vector2(pos_x.x, pos_y.y)
    return position


func get_x_component(radius : float = 1.0) -> float:
    return get_component(radius).x


func get_y_component(radius : float = 1.0) -> float:
    return get_component(radius).y

