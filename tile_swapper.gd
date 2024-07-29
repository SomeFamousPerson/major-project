extends Node2D
const RANGE = 3
var tilemap = TileMap

#func _physics_process(delta):
	#print(tilemap)
	#var mouse = get_global_mouse_position()
	#if Input.is_action_just_pressed("click"):
		#var cell = Vector2i(mouse)/tilemap.tile_set.tile_size/Vector2i(tilemap.scale)
		#print("world position: ",cell)
		#print ("atlas position: ", tilemap.get_cell_atlas_coords(0, cell))
		#if tilemap.get_cell_atlas_coords(0, cell) == Vector2i(0,0):
			#print("black")
			#tilemap.set_cell(0,cell,0,Vector2(1,0))
		#elif tilemap.get_cell_atlas_coords(0, cell) == Vector2i(1,0):
			#print("white")
			#tilemap.set_cell(0,cell,0,Vector2(-1,-1))
			##tilemap.set_cell(0,cell,0,Vector2(0,1))
		#else:
			#print("empty")
			#tilemap.set_cell(0,cell,0,Vector2(0,0))
