extends KinematicBody2D


#var velocity = Vector2(-100,0)
#var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

var move_direction = Vector2.ZERO
#export var speed : float = 40
var velocity = Vector2.ZERO
var speed = 100

func _physics_process(delta):
	if velocity == Vector2.ZERO:
		generate_random_velocity()
	var motion = velocity * delta
	move_and_slide(motion)
	if is_on_wall():
		print("wall")
	
func generate_random_velocity():
	velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized() * speed



#func _physics_process(delta):
##	move_direction.x = randf()
##	move_direction.y = randf()
##	print(move_direction)
##	move_and_slide((move_direction*speed) *delta)
#	randomize()
##	print("-----------")
#	velocity.y += 2
#
#	if is_on_wall():
##		velocity.y -= 7
#		velocity.y *= -1
#		print("wall")
#	print(velocity)
#	move_and_slide(velocity, Vector2(1,-1))
#	print("-----------")
	
	
	
#	var move = Vector2.ZERO
#	var direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
#	var speed = 3000
#	move = move.move_toward(move + direction * speed * delta, speed * delta)
#	var screen_size = get_viewport_rect().size
#	var new_position = position + move
#	new_position.x = clamp(new_position.x, 0, screen_size.x)
#	new_position.y = clamp(new_position.y, 0, screen_size.y)
#	position = new_position
#	if is_on_wall():
#		print("wall")
#	print(position)
