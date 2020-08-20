extends Node2D
class_name Intersections


var last_points := {} # Vector2 -> instance
onready var _accumulated_time := 0.0
onready var _start_delay := 0.1
onready var _next_to_start := 0
onready var _session_end_delay := 0.6
var _Waiting := false


enum DEBUG {Error, Info, Debug}
export(DEBUG) var debug_mode 


func _ready() -> void:
    last_points = update_intersections()


func _log(s, clear=false):
    if debug_mode >= DEBUG.Info:
        if clear:
            $"../Log".text = ""
            $"../Log".clear_undo_history()
        $"../Log".text = s


func _physics_process(delta: float) -> void:
    var points = update_intersections()
    _accumulated_time += delta
    if !_Waiting and _next_to_start < 20:
        if _accumulated_time >= _start_delay:
            _accumulated_time = 0.0
            last_points[last_points.keys()[_next_to_start]]._play("turn")
            _next_to_start += 1
    else:
        if _Waiting:
            if _accumulated_time >= _session_end_delay:
                _accumulated_time = 0.0
                _Waiting = false
            else:
                _accumulated_time += delta
            
        var deltas := {}
        for pid in range(len(last_points)):
            if points[points.keys()[pid]] != last_points[last_points.keys()[pid]]:
                deltas[pid] = points[pid]
        if deltas:
            for k in deltas.keys():
                points[k] = deltas[k]


func update_intersections() -> Dictionary:
    var s := ""
    for p in $X.get_children() + $Y.get_children():
        last_points[p.position] = p
        if _next_to_start == 0:
            p._stop()
        s += str(p.position.x) + str(p.position.y) + "\n"    
    return last_points


func halt_movements():
    for p in $X.get_children() + $Y.get_children():
        p._stop()
        
