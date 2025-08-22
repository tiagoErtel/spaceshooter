extends Control

func _ready():
	$VBoxContainer/ScoreLabel.text = "YOUR SCORE: " + str(Global.score)


func _input(event):
	if event.is_action_pressed("start_again"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
