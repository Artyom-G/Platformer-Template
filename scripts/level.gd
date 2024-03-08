extends Node
class_name Level

@onready var tile_map: TileMap = $LevelTileMap
@onready var player: Player = $Player
signal level_changed(level_name: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	if (player == null): return
	player.init(self)
	
	for child in get_children():
		if (child is LevelObject):
			child.player = player
			child.level = self

# return the boundaries of the level
func get_limits() -> Rect2i:
	var limits: Rect2i = tile_map.get_used_rect()
	var tile_size: Vector2i = tile_map.tile_set.tile_size
	limits.position[0] *= tile_size[0]
	limits.position[1] *= tile_size[1]
	limits.end[0] *= tile_size[0]
	limits.end[1] *= tile_size[1]
	
	return limits
