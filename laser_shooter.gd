extends StaticBody2D
var world
var laser = preload("res://laser.tscn")
var RANGE = 10


func _ready():
	if Global.level == 0:
		world =  %TileMap
		#gets the tilemap grid position of the square the laser shooter is in
		var cell = Vector2i(position)/world.tile_set.tile_size/Vector2i(world.scale)
		var new_laser = laser.instantiate()
		var atlas = Vector2i(world.get_cell_atlas_coords(0, cell))
		for i in RANGE:
			if atlas == Vector2i(-1,-1):
				add_child(new_laser)
				print(i)
				new_laser.position = cell+Vector2i(-1,(i*16))
#
func _physics_process(delta):
	pass
