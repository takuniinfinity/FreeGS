extends Node2D

var touch_pos: Vector2
var touch_drag: Vector2

func _ready() -> void:
	pass

func _input(event) -> void:
	if event is InputEventScreenTouch:
		touch_pos = event.position
	elif event is InputEventScreenDrag:
		touch_drag = event.position
		if touch_drag != touch_pos:
			$camera.translate(touch_drag-touch_pos)
