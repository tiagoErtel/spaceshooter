extends AnimatedSprite2D

var speed: int

func _ready():
	var rng := RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	
	position = Vector2(random_x, random_y)
	
	speed = rng.randi_range(10, 50)
	
	var size: float = rng.randf_range(1,4)
	scale = Vector2(size, size)
	
	speed_scale = size / 3
	
	modulate.a = size / 10

func _process(delta):
	position += Vector2(0, 1.0) * speed * delta
