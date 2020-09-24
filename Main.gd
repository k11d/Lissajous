extends Node2D

onready var tracer_scene := preload("res://Tracer.tscn")
onready var spots := {
    $Position2D  : null,
    $Position2D2 : null,
    $Position2D3 : null,
    $Position2D4 : null,
}

func _ready() -> void:
    for target in spots.keys():
        var t = tracer_scene.instance()
        target.add_child(t)
        t.set_owner(target)
        spots[target] = t

