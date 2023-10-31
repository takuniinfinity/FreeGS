extends ScrollContainer

var p

func _ready() -> void:
	p = get_tree().root.get_child(0)
	pass

func _on_btn_map_button_up() -> void:
	p.change_scene("res://scene/map_editor.tscn")
