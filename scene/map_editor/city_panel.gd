extends Panel

onready var map_editor = get_parent().get_parent()

func _ready() -> void:
	pass

func _on_btn_close_pressed() -> void: hide()

func _on_btn_del_pressed() -> void:
	map_editor.city_select.free()
	hide()

func _on_city_panel_visibility_changed() -> void:
	if visible: map_editor._terrain_change(0)

func _on_name_text_changed(new_text: String) -> void:
	map_editor.city_select.name = new_text
