extends Area2D

func _on_PowerUp_body_entered(body):
	if body.is_in_group("personaje"):
		body.powerup = true
		body.isTripleShoot = true
		queue_free()
