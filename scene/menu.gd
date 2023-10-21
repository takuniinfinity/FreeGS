extends TextureRect

func _ready() -> void:
	TranslationServer.set_locale("id")
	pass

func _keluar() -> void: get_tree().quit()
