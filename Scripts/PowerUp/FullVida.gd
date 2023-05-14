extends Area2D

func _on_FullVida_body_entered(body):
	if body.is_in_group("personaje"):
		Global.add_vida()
		body.up_vida()
		queue_free()
