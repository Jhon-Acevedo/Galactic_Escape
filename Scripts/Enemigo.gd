extends Area2D

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
