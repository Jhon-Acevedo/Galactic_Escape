extends Area2D
class_name Enemy

# Puntos del enemigo
export (int) var puntos = 50

var velocity = Vector2.ZERO
var speed = 100

func _physics_process(delta):
	if velocity == Vector2.ZERO:
		generate_random_velocity()
	var motion = velocity * delta
	translate(motion)
	
# Funcion para generar una velocidad aleatoria al enemigo
func generate_random_velocity():
	velocity = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized() * speed
	

# Funcion para que reboten los enemigos al estar en contacto con el TM
func _on_Enemigo_body_entered(body):
	if body.get_class() == "TileMap":
		velocity.y *= -1
		velocity.x *= -1

func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite.animation = "explosion"
	$AudioStreamPlayer.play()
	yield($AnimatedSprite,"animation_finished")
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
