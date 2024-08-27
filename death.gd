extends Area2D


func _on_body_entered(body):
	print("something entered")
	#Global.swappers_remaining = 2
	get_tree().change_scene_to_file("res://you_died.tscn")
	
