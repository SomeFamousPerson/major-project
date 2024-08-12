extends Node2D
var mouse = get_global_mouse_position()
var atlas = Vector2i(0,0)
var tileswapper = preload("res://tile_swapper.tscn")
	
func _ready():
	Global.swappers_remaining = 100

func _physics_process(delta):
	var tilemap = $TileMap
	#place tile-swappers
	#get mouse location
	mouse = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		#set the cell variable, which is what tilemap cell the mouse clicked on
		var cell = Vector2i(mouse)/tilemap.tile_set.tile_size/Vector2i(tilemap.scale)
		#gets the position of that cell in the world
		var world_pos = Vector2(tilemap.map_to_local(cell*Vector2i(tilemap.scale)))
		#gets the atlas position of that cell(where on the tileset it is)
		atlas = Vector2i(tilemap.get_cell_atlas_coords(0, cell))
		#if that spot is free and you have swappers left, it places one
		if atlas == Vector2i(-1,-1) and Global.swappers_remaining >= 1: 
			print("valid spot")
			var swapper = tileswapper.instantiate()
			swapper.tilemap = $TileMap
			swapper.myLocation = cell
			add_child(swapper)
			#set size and position
			swapper.scale = Vector2(5.25,5.25)
			swapper.top_level = true
			swapper.global_position = (world_pos+Vector2(35,35))
			#sets directionm the swapper faces
			if Global.player_last_direction == -1:
				swapper.rotation = PI
			#confirms that you placed it and uses one up
			print("placed location: ", swapper.global_position)
			Global.swappers_remaining -= 1
			#sets a block in the background so that the game knows something is there
			tilemap.set_cell(0,cell,1,Vector2(8,10))
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		#TODO: MAKE A WAY TO UNPAUISE
		#ASK TOM MAYBE IDK
		# OR JUST TRIUAL AND ERROR TF OUT OF IT
	
	
