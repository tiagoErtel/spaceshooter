extends Area2D

signal collision

var max_speed := 500
var base_speed := 20
var speed: int
var rotation_speed: int
var direction_x: float

func _ready():	
	var rng := RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	
	position = Vector2(random_x, random_y)
	
	var textures = [
		"res://sprites/meteor/meteor_0.png",
		"res://sprites/meteor/meteor_1.png"
	]
	
	var texture = load(textures[rng.randi_range(0,1)])
	$MeteorImage.texture = texture
	
	speed = base_speed + Global.score
	speed = clamp(speed, base_speed, max_speed)
	
	rotation_speed = rng.randi_range(-10, 10)
	direction_x = rng.randf_range(-1, 1)


func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	call_deferred("queue_free")


func _on_area_entered(area):
	area.call_deferred("queue_free")
	call_deferred("queue_free")
