extends Node2D
const RANGE = 3
var myLocation = Vector2(0,0) 
var tilemap
var mouse_in = false

func _ready():
	print(tilemap)
	var targets = [Vector2i(myLocation+Vector2i(1,0)),Vector2i(myLocation+Vector2i(2,0)),Vector2i(myLocation+Vector2i(3,0))]
	print(targets)
	for i in RANGE:
		if tilemap.get_cell_atlas_coords(0,targets[i]) == Vector2i(-1,-1):
			tilemap.set_cell(0,targets[i],1,Vector2i(0,4))
		else:
			break

func _physics_process(delta):
	if Input.is_action_just_pressed("click") and mouse_in == true:
		tilemap.set_cell(0,myLocation,1,Vector2i(-1,-1))
		#TODO: DELETE SQUARES THAT GOT ADDED
		#SHOULD BE PRETTY EASY BYUT DONT HAVE TIME NOW
		#queue_free()


func _on_area_2d_mouse_entered():
	mouse_in = true
	print("mouse_in")

func _on_area_2d_mouse_exited():
	mouse_in = false

