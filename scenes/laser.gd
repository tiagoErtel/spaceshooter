extends Area2D

var speed: int = 600

func _process(delta):
	position.y -= speed * delta
