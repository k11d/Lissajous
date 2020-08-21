extends Position2D


var xcomp : Node
var ycomp : Node
var x_value : float
var y_value : float

var elapsed := 0.0
var x_angle_increment : float
var y_angle_increment : float
var x_radius : float
var y_radius : float
var x_theta : float = 0.0
var y_theta : float = 0.0


func _ready() -> void:
    xcomp = $X
    ycomp = $Y
    x_angle_increment = get_parent().x_angle_increment
    y_angle_increment = get_parent().y_angle_increment
    x_radius = get_parent().x_radius
    y_radius = get_parent().y_radius
    x_theta = get_parent().x_angle_offset
    y_theta = get_parent().y_angle_offset
    update_positions()



func update_positions():
    if xcomp.visible:
        x_theta += x_angle_increment
        var xp = polar2cartesian(x_radius, x_theta)
        x_value = xp.x
        xcomp.position.x = xp.x 
    if ycomp.visible:
        y_theta += y_angle_increment
        var yp = polar2cartesian(y_radius, y_theta) 
        y_value = yp.y
        ycomp.position.y = yp.y 

func _on_BtnX_pressed() -> void:
    xcomp.visible = !xcomp.visible

func _on_BtnY_pressed() -> void:
    ycomp.visible = !ycomp.visible
    
