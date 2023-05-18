extends Area2D

export (int) var velocidad = 500
export (int) var puntos = 50

onready var personaje = get_tree().get_nodes_in_group("personaje") 

var is_in_screen = false

func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite.animation = "explosion"
	$AudioStreamPlayer.play()
	yield($AnimatedSprite,"animation_finished")
	queue_free()


func _physics_process(delta):
	if is_in_screen:
		var posicion_personaje = personaje[0].global_position
		global_position = global_position.move_toward(posicion_personaje ,velocidad*delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	is_in_screen = true
	

