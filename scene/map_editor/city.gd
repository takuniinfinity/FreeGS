extends Sprite

onready var parent = get_parent()

var neighbour: Array
var terrain: String
var output: String

func _ready() -> void:
	texture = parent.terrain_image[terrain]
	pass
