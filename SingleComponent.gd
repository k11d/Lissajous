extends Position2D
class_name SingleComponent, "res://assets/orb_red.png"



var _theta := PI setget _set_theta
var _radius := 80.0 setget _set_radius
var _speed := 4.0 setget _set_speed

onready var component := name[0].to_lower()
onready var p1 := get_node("p1")
onready var value := 0.0 setget _set_out_value


func _set_theta(t):
	_theta = t

func _set_radius(r):
	_radius = r

func _set_speed(v):
	_speed = v

func _set_out_value(val):
	value = val
	$Control/ComponentUI/HBoxContainer3/lbl_pos.text = str(int(value))	

func _physics_process(delta):
	p1.position = polar2cartesian(_radius, _theta)
	if component == "x":
		_set_out_value(polar2cartesian(_radius, _theta).x)
	else:
		_set_out_value(polar2cartesian(_radius, _theta).y)
	_theta += delta * _speed


func _on_btn_speed_min_pressed():
	_speed -= 0.2
	$Control/ComponentUI/HBoxContainer3/lbl_speed.text = str(_speed)

func _on_btn_speed_plus_pressed():
	_speed += 0.2
	$Control/ComponentUI/HBoxContainer3/lbl_speed.text = str(_speed)


func _on_btn_offset_min_pressed():
	_theta -= 0.157
	$Control/ComponentUI/HBoxContainer3/lbl_offset.text = str(int(_theta))

func _on_btn_offset_plus_pressed():
	_theta += 0.157
	$Control/ComponentUI/HBoxContainer3/lbl_offset.text = str(int(_theta))
