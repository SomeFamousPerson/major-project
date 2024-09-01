extends Control


func _on_respawn_pressed():
	$Flag.go_to_level()
	
	#var level :String = "res://levels/level_"+str(Global.level+1)+".tscn"
	#print("respawb")
	#print(level)
	#
	#get_tree().change_scene_to_file(level)
