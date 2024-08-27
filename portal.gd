extends Area2D
signal partner(portal_position)
@export var colour = "green"
#var player = preload("res://player.tscn")
func _ready():
	if colour == "green":
		$green.visible = true
		$blue.visible = false
	elif colour == "blue":
		$blue.visible = true
		$green.visible = false
	

func _on_body_entered(body):
	print(self,body.position)
	partner.emit()
	


func _on_portal_partner():
	print(%Player)
	%Player.position = self.position+Vector2(200,0)


func _on_portal_2_partner():
	%Player.position = self.position+Vector2(200,0)
