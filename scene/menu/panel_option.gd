extends Panel

var waktu: float = 0.0
var hiding: bool = false

func _ready() -> void:
	set_process(false)
	pass

func remchild() -> void:
	if $container.get_child_count() > 1:
		$container.get_child(1).free()
	

func _process(dt) -> void:
	if hiding:
		if waktu >= 0.05:
			waktu = lerp(waktu, 0.0, 0.05)
		else:
			$container.get_child(1).free()
			hide()
			hiding = false
			set_process(false)
	else:
		if waktu < 1:
			waktu = lerp(waktu, 1.0, 0.05)
		else: set_process(false)

	material.set_shader_param("waktu", waktu)
	$container/label.material.set_shader_param("waktu", waktu)
	if $container.get_child_count() > 1: 
		$container.get_child(1).modulate.a = waktu
