extends Area2D


func _on_body_entered(body):
	print("something entered")
	get_tree().change_scene_to_file("res://you_died.tscn")
	
