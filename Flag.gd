extends Area2D





func _on_body_entered(body):
	print("flag_touched")
	Global.level += 1
	if Global.level == 1:
		Global.swappers_remaining = 2
		get_tree().change_scene_to_file("res://levels/level_2.tscn")
		
	elif Global.level == 2:
		Global.swappers_remaining = 2
		get_tree().change_scene_to_file("res://levels/level_3.tscn")	
		
	



##Funny cursed vesion of the level changing i made
## it is an awful bastardised way of doing it but it is funny

#var nextlevel = "res://levels/level_1.tscn"
#var levelNum = 1

#func _on_body_entered(body):
	#print("flag touched")
	##sets global variable of level to one higher
	#Global.level += 1
	## sets levelNum to be equal to Global.level, but as a string not an int
	#levelNum = str(Global.level)
	##changes the 20th character of the string "res://levels/level_1.tscn" to be equal to the next levels number??????
	##dont ask why i did this
	#nextlevel[19] = levelNum
	#print(nextlevel)
	##sets the scene to nextlevel (which was mmodified to have the name of the next level)
	#get_tree().change_scene_to_file(nextlevel)
