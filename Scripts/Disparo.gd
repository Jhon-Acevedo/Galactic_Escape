extends RigidBody2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemigo"):
		Global.add_puntos(area.puntos)
		area.set_explosion()
		queue_free()
	if area.is_in_group("boss"):
		Global.remove_vida_boss()
		Global.add_puntos(20)
		area.take_damage()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.get_class() == "TileMap":
		queue_free()

var velocidad_inicial = 100  # La velocidad inicial del disparo
var angulo_disparo = 45  # El ángulo del disparo en grados
var gravedad = 10000# Magnitud de la fuerza de gravedad
var velocidad = Vector2.ZERO

# https://calculadoradefisica.online/es/movimiento-parabolico.html 
func _physics_process(delta):
	if Global.is_level3(): 
		if Input.is_action_just_pressed("attack"):
			var radianes = deg2rad(angulo_disparo)
			var direccion = Vector2(cos(radianes), sin(radianes))
			velocidad = direccion * velocidad_inicial
			var timepo_vuelo = (2*velocidad_inicial) * sin(radianes) / gravedad
			var altura_maxima = (pow(velocidad_inicial,2) * pow(sin(radianes),2)) / (2*gravedad)
			print("Velocidad: ",velocidad)
			print("Tiempo de vuelo: ",timepo_vuelo)
			print("Altura Maxima: ",altura_maxima)
		velocidad.y += gravedad * delta  # Aplicar la fuerza de gravedad
		apply_central_impulse(velocidad * delta)
