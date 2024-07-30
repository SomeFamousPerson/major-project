extends Node2D
var mouse = get_global_mouse_position()
var atlas = Vector2i(0,0)
var swappers_remaining = 1000
var tileswapper = preload("res://tile_swapper.tscn")
	
	
func _physics_process(delta):
	var tilemap = $TileMap
	
	#place tile-swappers
	#get mouse location
	mouse = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		#print(tilemap)
		#set the cell variable, which is what tilemap cell the mouse clicked on
		var cell = Vector2i(mouse)/tilemap.tile_set.tile_size/Vector2i(tilemap.scale)
		#print("cell position: ",cell)
		#gets the position of that cell in the world
		var world_pos = Vector2(tilemap.map_to_local(cell*Vector2i(tilemap.scale)))
		#print("world position: ",world_pos)
		#gets the atlas position of that cell(where on the tileset it is)
		atlas = Vector2i(tilemap.get_cell_atlas_coords(0, cell))
		#print("atlas position: ",atlas)
		#if that spot is free and you have swappers left, it places one
		if atlas == Vector2i(-1,-1) and swappers_remaining >= 1: 
			print("valid spot")
			var swapper = tileswapper.instantiate()
			add_child(swapper)
			swapper.scale = Vector2(5.25,5.25)
			#swapper.top_level = true
			swapper.global_position = (world_pos)#-Vector2(28,49))
			print("placed location: ", swapper.global_position)
			swappers_remaining -= 1
	
