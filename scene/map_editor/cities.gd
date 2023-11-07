extends Node

enum TerrainType {
	FOREST,
	DESERT,
	TROPICAL
}

# PACKAGE
const terrain_image = {
	"rainforest" : preload("res://asset/image/terrain/tropical_rainforest32.jpg"),
	"desert" : preload("res://asset/image/terrain/desert32.jpg"),
	"boreal" : preload("res://asset/image/terrain/boreal32.jpg"),
	"tundra" : preload("res://asset/image/terrain/tundra32.jpg"),
	"meadow" : preload("res://asset/image/terrain/meadow32.jpg"),
	"ocean" : preload("res://asset/image/terrain/ocean32.jpg")
}

func _ready() -> void:
	print(terrain_image)
	pass
