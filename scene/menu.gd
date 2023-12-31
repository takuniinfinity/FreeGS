extends TextureRect

# OPTION OBJECT
var opt: Dictionary = {
	"btn_about" : preload("res://scene/menu/credits.tscn"),
	"btn_setting" : preload("res://scene/menu/setting.tscn"),
	"btn_database" : preload("res://scene/menu/database.tscn")
}

var cf: = ConfigFile.new()

# CHANGE SCENE
var scene: String
var cs: bool = false

var waktu: float = 0.0
const speed = 0.05

onready var audio := $audio

func _ready() -> void:
	cf.load("user://config.ini")
	var lang = cf.get_value("0", "language", "en")
	$music.volume_db = cf.get_value("0", "music", 0)
	TranslationServer.set_locale(lang)
	cf.save("user://config.ini")

func _process(dt: float) -> void:
	if cs:
		if modulate.a > 0.01: modulate.a = lerp(modulate.a, 0, speed)
		else: get_tree().change_scene(scene)
	else:
		if waktu < 1.0:
			waktu = lerp(waktu, 1.0, speed)
			$panel.material.set_shader_param("waktu", waktu)
			for o in $panel/container.get_children():
				o.material.set_shader_param("waktu", waktu)
		else: set_process(false)

func _keluar() -> void: get_tree().quit()

func _boption_pressed(name: String) -> void:
	var proses: bool = $panel_option.is_processing()
	if $panel_option.visible:
		if $panel_option/container/label.text == name:
			#$panel_option.waktu = 1.0
			$panel_option.hiding = true
			proses = true
		else:
			$panel_option.remchild()
			$panel_option/container.add_child(opt[name].instance())
	else:
		#$panel_option.waktu = 0.0
		$panel_option/container.add_child(opt[name].instance())
		$panel_option.show()
		proses = true
	$panel_option.set_process(proses)
	$panel_option/container/label.text = name
	audio.play()

func change_scene(sc: String) -> void:
	scene = sc
	cs = true
	set_process(true)
