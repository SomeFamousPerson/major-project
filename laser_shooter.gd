extends StaticBody2D
var world
var laser = preload("res://laser.tscn")
var RANGE = 4
var cell

func _physics_process(delta):
	
	var children = $laserbeams.get_children()
	#print(children)
	for c in children:
		#print("children: ",c)
		c.queue_free()
		#self.queue_free()


	world =  %TileMap
	#gets the tilemap grid position of the square the laser shooter is in
	for i in RANGE-1:
			cell = Vector2i(position-Vector2((i+1)*14,0))/world.tile_set.tile_size/Vector2i(world.scale)
#			print(cell)
			var atlas = Vector2i(world.get_cell_atlas_coords(0, cell))
			#print(atlas)
			if atlas != Vector2i(0,4):
				var new_laser = laser.instantiate()
				new_laser.position = cell+Vector2i(-1,(i+1)*16)
				$laserbeams.add_child(new_laser)
			else:
				print("no child")

				#var new_node2d = Node2D.new()
				#add_child(new_node2d)
				#new_node2d.name = "laserbeams"
				#$laserbeams.add_child(new_laser)
				

