extends Node2D
var mouse = get_global_mouse_position()
var atlas = Vector2i(0,0)
var swappers_remaining = 1
var tileswapper = preload("res://tile_swapper.tscn")
	
	
func _physics_process(delta):
	var tilemap = $TileMap
	#place tile-swappers
	mouse = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		var cell = Vector2i(mouse)/tilemap.tile_set.tile_size#/Vector2i(tilemap.scale)
		print("cell position: ",cell)
		var world_pos = Vector2i(tilemap.map_to_local(cell))
		print("world position: ",world_pos)
		#print ("atlas position: ", tilemap.get_cell_atlas_coords(0, cell))
		atlas = Vector2i(tilemap.get_cell_atlas_coords(0, cell))
		if atlas == Vector2i(-1,-1) and swappers_remaining <= 1:
			print("valid spot")
			var swapper = tileswapper.instantiate()
			add_child(swapper)
			#swapper.top_level = true
			swapper.global_position = world_pos
			print("placed location: ", swapper.global_position)


