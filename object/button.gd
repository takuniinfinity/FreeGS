extends Button

var waktu: float = 0.0
export var speed: = 0.05

func _ready() -> void:
	pass

func _process(dt) -> void:
	if waktu < 1.0:
		waktu = lerp(waktu, 1.0, speed)
		material.set_shader_param("waktu", waktu)
	else: set_process(false)

func _on_button_visibility_changed() -> void:
	if visible:
		waktu = 0.0
		set_process(true)
