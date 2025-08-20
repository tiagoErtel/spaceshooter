extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var star_scene: PackedScene = load("res://scenes/star.tscn")

func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	
	$Meteors.add_child(meteor)
	
	meteor.connect('collision', _on_meteor_collision)


func _on_meteor_collision():
	print('bateu')
	


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	
	$Lasers.add_child(laser)
	
	laser.position = pos


func _on_stars_timer_timeout():
	var star = star_scene.instantiate()
	
	$Stars.add_child(star)
