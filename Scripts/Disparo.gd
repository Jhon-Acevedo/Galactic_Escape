extends RigidBody2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemigo"):
		Global.add_puntos(area.puntos)
		area.set_explosion()
		queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.get_class() == "TileMap":
		queue_free()
#		print("TM")
	if body.get_class() == 'Enemy':
		print("enemy")
