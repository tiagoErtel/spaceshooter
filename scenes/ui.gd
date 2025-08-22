extends CanvasLayer

var life_ico = load("res://sprites/spaceship/spaceship_0.png")
@onready var health_bar = $MarginContainer2/HealthBar

@onready var score_label = $MarginContainer/ScoreLabel

func set_health(amount):
	for child in health_bar.get_children():
		child.call_deferred("queue_free")
		
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = life_ico
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		health_bar.add_child(text_rect)


func update_score():
	score_label.text = str(Global.score)
