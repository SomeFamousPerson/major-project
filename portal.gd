extends Area2D
signal partner

func _on_body_entered(body):
	print(body.position)
