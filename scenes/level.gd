extends Node2D

@onready var player = $Player
@onready var ui = $UI
@onready var meteors = $Meteors
@onready var lasers = $Lasers
@onready var stars = $Stars

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var star_scene: PackedScene = load("res://scenes/star.tscn")

func _ready():
	ui.set_health(player.health)

	Global.score = 0
	ui.update_score()


func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	meteors.add_child(meteor)
	meteor.connect('collision', _on_meteor_collision)


func _on_meteor_collision():
	player.take_damage()
	ui.set_health(player.health)

	if not player.is_alive:
		get_tree().change_scene_to_file("res://game_over.tscn")


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	lasers.add_child(laser)
	laser.position = pos


func _on_stars_timer_timeout():
	var star = star_scene.instantiate()
	stars.add_child(star)


func _on_score_timer_timeout():
	Global.score += 1
	ui.update_score()
