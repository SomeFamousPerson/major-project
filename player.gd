extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var gravity = 400
var direction

func _ready():
	$CanvasLayer.visible = false


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta


	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	direction = Input.get_axis("left", "right")
	#if the last direction is different from the current directio nmthe the direction is true(does not = 0), setslast_direction to direction
	if direction != Global.player_last_direction and direction:
		Global.player_last_direction = direction
	if direction: 
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
	
	if Input.is_action_just_pressed("swap type"):
		if Global.swap_type == 1:
			Global.swap_type = 2
		elif Global.swap_type == 2:
			Global.swap_type =1
	if Global.swap_type == 1:
		$Camera2D/CanvasLayer/Label.text = ("Swap type: build")
	else:
		$Camera2D/CanvasLayer/Label.text = "Swap type: remove"
	#when esc pressed, show pause screen and pause game
	if Input.is_action_just_pressed("pause"):
		$CanvasLayer.visible = true
		get_tree().paused = true
	

#unpause game
func _on_pause_button_pressed():
	get_tree().paused = false
	$CanvasLayer.visible = false


func _on_quit_to_menu_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
