extends CharacterBody2D

var health: int = 5
var is_alive: bool = true
var speed : int = 500
var can_shoot: bool = true

signal laser(pos)

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position)
		$LaserSound.play()
		can_shoot = false
		$LaserCooldown.start()


func _on_laser_cooldown_timeout():
	can_shoot = true


func take_damage():
	health -= 1
	if health <= 0:
		is_alive = false
