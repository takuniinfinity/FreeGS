extends TextureRect

# OPTION OBJECT
var opt: Dictionary = {
	"btn_about" : preload("res://scene/menu/credits.tscn"),
	"btn_setting" : preload("res://scene/menu/setting.tscn")
}

var waktu: float = 0.0
const speed = 0.05

func _ready() -> void:
	TranslationServer.set_locale("id")
	pass

func _process(dt) -> void:
	if waktu < 1.0:
		waktu = lerp(waktu, 1.0, speed)
		$panel.material.set_shader_param("waktu", waktu)
		for o in $panel/container.get_children():
			o.material.set_shader_param("waktu", waktu)
	else: set_process(false)

func _keluar() -> void: get_tree().quit()

func _boption_pressed(name: String) -> void:
	print($panel_option.visible)
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
