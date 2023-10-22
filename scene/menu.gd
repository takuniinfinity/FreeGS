extends TextureRect

var waktu: float = 0.0
const speed = 0.05

func _ready() -> void:
	TranslationServer.set_locale("id")
	pass

func _process(dt):
	if waktu < 1.0:
		waktu = lerp(waktu, 1.0, speed)
		$panel.material.set_shader_param("waktu", waktu)
		for o in $panel/container.get_children():
			o.material.set_shader_param("waktu", waktu)
	else: set_process(false)

func _keluar() -> void: get_tree().quit()
