extends Node2D

onready var map_editor = get_parent().get_parent()
onready var camera = map_editor.get_node("camera")

func _ready() -> void: update()

func _draw() -> void:
	var ss: Vector2 = OS.window_size
	draw_line(Vector2(ss.x/2, 0), Vector2(ss.x/2, ss.y), Color.green, 2.0)
	draw_line(Vector2(0, ss.y/2), Vector2(ss.x, ss.y/2), Color.green, 2.0)


func _on_btn_oke_pressed() -> void:
	if map_editor.mode == map_editor.Mode.MOVE:
		var pos: Vector2 = Vector2(
			camera.global_position.x + OS.window_size.x/2,
			camera.global_position.y + OS.window_size.y/2
		)
		if not map_editor.something_here:
			map_editor.city_select.global_position = pos
			map_editor.get_node("CanvasLayer/panel/btn_oke").hide()
			map_editor._btn_mode_pressed(0) # mode select
			map_editor._city_click(map_editor.city_select)
			hide()
		else: map_editor.show_notification("notif_location_not_empty")
