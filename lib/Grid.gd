tool
extends Node2D
class_name Intersections


var points :={}
onready var _accumulated_time := 0.0
onready var _start_delay := 0.1
onready var _next_to_start := 0



func _log(s, clear=false):
    if clear:
        $"../Log".clear_undo_history()
        $"../Log".text = ""
    $"../Log".text = s

func _ready() -> void:
    for p in update_intersections():
        if p and has_method("stop"):
            p.stop()


func _process(delta: float) -> void:
    var points = update_intersections()
    if _next_to_start and _next_to_start < 20:
        _accumulated_time += delta
        if _accumulated_time >= _start_delay:
            _accumulated_time = 0.0
            points[points.keys()[_next_to_start]].play("turn")
            _next_to_start += 1
    

func update_intersections() -> Dictionary:
    var points := {}
    var s := ""
    for p in $X.get_children() + $Y.get_children():
        points[p.position] = p
        s += str(p.position.x) + str(p.position.y) + "\n"    
    _log(s, true)
    return points
