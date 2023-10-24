extends ScrollContainer

var lang: Array = ["id", "en"]

func _ready() -> void:
	pass

func _on_OptionButton_item_selected(idx) -> void:
	TranslationServer.set_locale(lang[idx])
