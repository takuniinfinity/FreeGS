extends ScrollContainer

var lang: Array = ["id", "en"]
onready var optionBtn = $container/language/OptionButton

var cf: = ConfigFile.new()

func _ready() -> void:
	cf.load("user://config.ini")
	optionBtn.select(lang.find(TranslationServer.get_locale(), 0))
	pass

func _on_OptionButton_item_selected(idx) -> void:
	TranslationServer.set_locale(lang[idx])
	cf.set_value("0", "language", lang[idx])


func _on_setting_tree_exiting() -> void:
	cf.save("user://config.ini")
