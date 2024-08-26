extends Node2D
const RANGE = 3
var myLocation = Vector2(0,0) 
var tilemap
var mouse_in = false
var targets
var swap_type = Global.swap_type
func _ready():

	print(tilemap)
	if Global.player_last_direction == 1:
		targets = [Vector2i(myLocation+Vector2i(1,0)),Vector2i(myLocation+Vector2i(2,0)),Vector2i(myLocation+Vector2i(3,0))]
	else:
		targets = [Vector2i(myLocation+Vector2i(-1,0)),Vector2i(myLocation+Vector2i(-2,0)),Vector2i(myLocation+Vector2i(-3,0))]
	print(targets)
	#if it swaps air to solid
	if swap_type == 1:
		$"Tileswapper sprite".visible = true
		$"reverse tileswapper".visible = false
		for i in RANGE:
			if tilemap.get_cell_atlas_coords(0,targets[i]) == Vector2i(-1,-1):
				tilemap.set_cell(0,targets[i],1,Vector2i(0,4))
			else:
				break
	elif swap_type == 2:
		$"reverse tileswapper".visible = true
		$"Tileswapper sprite".visible = false
		for i in RANGE:
			if tilemap.get_cell_atlas_coords(0,targets[i]) == Vector2i(0,4):
				tilemap.set_cell(0,targets[i],1,Vector2i(-1,-1))
		
		
func _physics_process(delta):
	if Input.is_action_just_pressed("click") and mouse_in == true:
		tilemap.set_cell(0,myLocation,1,Vector2i(-1,-1))
		if swap_type == 1:
		#reverse of previous similar code, deletes the blocks that got placed by the bridge
			for i in RANGE:
				#if block is solid AND was not solid in the original map
				if tilemap.get_cell_atlas_coords(0,targets[i]) == Vector2i(0,4) and tilemap.get_cell_atlas_coords(1,targets[i]) != Vector2i(0,4):
					#make it empty
					tilemap.set_cell(0,targets[i],1,Vector2i(-1,-1))
				else:
					break
		elif swap_type == 2:
			for i in RANGE:
				#if block is air and was solid in orignal map
				if tilemap.get_cell_atlas_coords(0,targets[i]) == Vector2i(-1,-1) and tilemap.get_cell_atlas_coords(1,targets[i]) == Vector2i(0,4):
					#make it solid
					tilemap.set_cell(0,targets[i],1,Vector2i(0,4))
		Global.swappers_remaining += 1
		#if the original map should have a square where this is, replace it
		if tilemap.get_cell_atlas_coords(1,myLocation) == Vector2i(0,4):
			tilemap.set_cell(0,myLocation,1,Vector2i(0,4))
		queue_free()


func _on_area_2d_mouse_entered():
	mouse_in = true

func _on_area_2d_mouse_exited():
	mouse_in = false

