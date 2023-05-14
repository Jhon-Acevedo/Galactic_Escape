extends AnimatedSprite

export (String, FILE) var NextLevel
onready var personaje = get_tree().get_nodes_in_group("personaje")[0]




func cinematica():
	Global.cinematica = true
	var personaje_position = personaje.global_position
	var posicion_antena = $PosicionAntena.global_position
	var posicion_salida = $PosicionSalida.global_position
	$Tween.interpolate_property(
		personaje,
		"global_position",
		personaje_position,
		posicion_antena,
		2
	)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	$AnimationPlayer.play("meta")
	yield($AnimationPlayer,"animation_finished")
	$Tween.interpolate_property(
		personaje,
		"global_position",
		posicion_antena,
		posicion_salida,
		2
	)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	Global.cinematica = false
	get_tree().change_scene(NextLevel)

func _on_VisibilityNotifier2D_screen_entered():
	cinematica()
