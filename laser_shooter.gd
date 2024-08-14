extends StaticBody2D
var world
var laser = preload("res://laser.tscn")
var RANGE = 4


func _physics_process(delta):
	if Global.level == 0:
		world =  %TileMap
		#gets the tilemap grid position of the square the laser shooter is in
		for i in RANGE-1:
			var cell = Vector2i(position-Vector2((i+1)*14,0))/world.tile_set.tile_size/Vector2i(world.scale)
			var atlas = Vector2i(world.get_cell_atlas_coords(0, cell))
			if atlas == Vector2i(-1,-1):
				var new_laser = laser.instantiate()
				new_laser.position = cell+Vector2i(-1,(i+1)*16)
				add_child(new_laser)
				#print(i)
			else:
				print("abcdddd")

