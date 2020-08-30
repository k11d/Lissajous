extends Node2D

var elapsed := 0.0


func _process(delta: float) -> void:
    elapsed += delta
    if elapsed >= 10.0:
        elapsed -= 10.0
        var points := PoolVector2Array()
        var pcount = $Line2D.get_point_count()
        var n = 0
        for p in $Line2D.points:
            if n <= pcount / 3:
                n += 1
                continue
            else:
                points.append(p)
                n += 1
        $Line2D.clear_points()
        $Line2D.draw_polyline(points)


func move(p) -> void:
    $Control.position = p

func draw_point() -> void:
    $Line2D.add_point($Control.position)

func clear_trace() -> void:
    $Line2D.points.empty()


