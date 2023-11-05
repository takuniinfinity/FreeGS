extends Node2D

const terrain_image = {
	"rainforest" : preload("res://asset/image/terrain/tropical_rainforest.png"),
	"desert" : preload("res://asset/image/terrain/desert.png"),
	"boreal" : preload("res://asset/image/terrain/boreal.png"),
	"tundra" : preload("res://asset/image/terrain/tundra.png"),
	"meadow" : preload("res://asset/image/terrain/meadow.png"),
	"ocean" : preload("res://asset/image/terrain/ocean.png")
}

var touch_pos: Vector2
var touch_drag: Vector2

onready var camera = $camera
onready var ccity = $CanvasLayer/create_city
onready var btn_oke = $CanvasLayer/panel/btn_oke
onready var notif = $CanvasLayer/panel/notification
onready var city_panel = $CanvasLayer/city_panel

var something_here: bool = false # CURSOR

enum Mode { SELECT=0, ADD=1 }
var mode = Mode.SELECT
var city_select: Sprite

var cf: = ConfigFile.new()

func _ready() -> void:
	cf.load("user://config.ini")
	$music.volume_db = cf.get_value("0", "music", 0)
	_btn_mode_pressed(mode)
	pass

func _process(dt: float) -> void:
	$area.global_position = Vector2(
		camera.global_position.x + OS.window_size.x/2,
		camera.global_position.y + OS.window_size.y/2
	)
	something_here = $area.get_overlapping_areas().size() > 0

func _input(event) -> void:
	if event is InputEventScreenDrag:
		camera.global_translate(-event.relative*camera.zoom)

func _on_btn_back_pressed() -> void:
	get_tree().change_scene("res://scene/menu.tscn")

func _btn_mode_pressed(mod: int) -> void:
	$CanvasLayer/panel/container/btn_select.text = "btn_select"
	$CanvasLayer/panel/container/btn_add_city.text = "btn_add_city"
	
	ccity.hide()
	btn_oke.hide()
	city_panel.hide()
	
	set_process(false)
	
	mode = mod
	if mode == Mode.ADD:
		ccity.show()
		$CanvasLayer/panel/container/btn_add_city.text = "btn_add_city*"
		btn_oke.text = "btn_add"
		btn_oke.show()
		set_process(true)
	elif mode == Mode.SELECT:
		$CanvasLayer/panel/container/btn_select.text = "btn_select*"

func show_notification(msg: String) -> void:
	notif.text = msg
	notif.show()
	$timer.start()
	

func _on_timer_timeout() -> void: notif.hide()

func _city_click(city: Sprite) -> void:
	if mode == Mode.SELECT:
		city_select = city
		city_panel.get_node("name").text = city_select.name
		city_panel.get_node("terrain").texture = terrain_image[city_select.terrain]
		city_panel.show()
		print(city_select)
