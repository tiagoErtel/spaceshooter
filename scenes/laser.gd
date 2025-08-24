extends Area2D

var speed: int = 300

func _process(delta):
	position.y -= speed * delta
