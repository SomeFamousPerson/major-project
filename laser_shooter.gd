extends StaticBody2D
var world
var laser = preload("res://laser.tscn")
var RANGE = 4


func _physics_process(delta):
	#var children = $laserbeams.get_children()
	##print(children)
	#for c in children:
		#print("children: ",c)
		##$laserbeams.remove_child(c)
		#$laserbeams.queue_free()

	if Global.level == 0:
		world =  %TileMap
		#gets the tilemap grid position of the square the laser shooter is in
		for i in RANGE-1:
			var cell = Vector2i(position-Vector2((i+1)*14,0))/world.tile_set.tile_size/Vector2i(world.scale)
			var atlas = Vector2i(world.get_cell_atlas_coords(0, cell))
			if atlas == Vector2i(-1,-1):
				var new_laser = laser.instantiate()
				new_laser.position = cell+Vector2i(-1,(i+1)*16)
				#
				#var new_node2d = Node2D.new()
				#add_child(new_node2d)
				#new_node2d.name = "laserbeams"
				#$laserbeams.add_child(new_laser)
				
			else:
				print("abcdddd")

