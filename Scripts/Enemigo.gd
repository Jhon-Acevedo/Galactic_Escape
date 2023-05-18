extends Area2D
class_name Enemy

export (int) var puntos = 50

func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite.animation = "explosion"
	$AudioStreamPlayer.play()
	yield($AnimatedSprite,"animation_finished")
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.

var velocity = Vector2.ZERO
var speed = 100

func _physics_process(delta):
	if velocity == Vector2.ZERO:
		generate_random_velocity()
	var motion = velocity * delta
	translate(motion)
	
func generate_random_velocity():
	velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized() * speed
#	var move = Vector2.ZERO
#	var direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
#	var speed = 3000
#	move = move.move_toward(move + direction * speed * delta, speed * delta)
##	move.move
#	var screen_size = get_viewport_rect().size
#	var new_position = position + move
#	new_position.x = clamp(new_position.x, 0, screen_size.x)
#	new_position.y = clamp(new_position.y, 0, screen_size.y)
#	position = new_position
#	if is_on_wall():
#		print("wall")
#	print(position)


func _on_Enemigo_body_entered(body):
	if body.get_class() == "TileMap":
		 velocity.y *= -1
#		pass
	pass
	
