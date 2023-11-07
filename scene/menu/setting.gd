extends ScrollContainer

onready var menu = get_parent().get_parent().get_parent()

var lang: Array = ["id", "en"]
onready var optionBtn = $container/language/option

var cf: = ConfigFile.new()

func _ready() -> void:
	cf.load("user://config.ini")
	optionBtn.select(lang.find(TranslationServer.get_locale(), 0))
	$container/music/slider.value = cf.get_value("0", "music", 0)
	$container/audio/slider.value = cf.get_value("0", "audio", 0)
	_on_slider_music_value_changed($container/music/slider.value)
	_on_slider_audio_value_changed($container/audio/slider.value)
	pass

func _on_OptionButton_item_selected(idx) -> void:
	TranslationServer.set_locale(lang[idx])
	cf.set_value("0", "language", lang[idx])

func _on_setting_tree_exiting() -> void:
	cf.set_value("0", "music", menu.get_node("music").volume_db)
	cf.set_value("0", "audio", menu.get_node("audio").volume_db)
	cf.save("user://config.ini")

func _on_slider_music_value_changed(value: float) -> void:
	var maxi = $container/music/slider.max_value
	var mini = $container/music/slider.min_value
	var tot = maxi + abs(mini)
	$container/music/percent.text = str(round((value+abs(mini))/tot * 100))+"%"
	menu.get_node("music").volume_db = value


func _on_slider_audio_value_changed(value: float) -> void:
	var maxi = $container/audio/slider.max_value
	var mini = $container/audio/slider.min_value
	var tot = maxi + abs(mini)
	$container/audio/percent.text = str(round((value+abs(mini))/tot * 100))+"%"
	menu.get_node("audio").volume_db = value
