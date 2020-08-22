extends Control

enum Cmp {X, Y, BOTH}
var targets := []
var tracers := []
export(float) var radius := 2.5


func _ready() -> void:
    for n in range(1, 7):
        tracers.append([
            get_node("Tracers/" + str(n))])
        targets.append(
            get_node("Targets/" + str(n)))


func _process(delta: float) -> void:

    var x_values := []
    var y_values := []
    
    for n_row in range(6):
        for tgt in targets[n_row].get_children():
            tgt.clear_trace()
            

    for n_row in range(6):
        var trow = targets[n_row]
        var _tr = tracers[n_row]
        var xy = _tr[0].get_component(radius)
        x_values.append(xy.x)
        y_values.append(xy.y)

    for n_row in range(6):
        for tgt in targets[n_row].get_children():
            var _x = x_values[n_row]
            var _y = y_values[n_row]
            tgt.move(Vector2(_x, _y))
            tgt.draw_point()
