extends Area2D

onready var line_2D = $Line2D

var trail_lenght = 10
var point = Vector2()
var speed : float

func _process(delta):
	if global_position != Vector2.ZERO:
		line_2D.set_as_toplevel(true)
		point = global_position
		line_2D.add_point(point)
		while line_2D.get_point_count() > trail_lenght:
			line_2D.remove_point(0)
	speed += 1000 * delta
	global_position = global_position.move_toward($Position2D.global_position, speed * delta )

func _on_StaticBody2D_area_entered(area):
	if area.get_parent() is PLAYER:
		queue_free()
	
#	if area.get_parent() is PLAYER:
#		area.take_damage()
##		print("le pego al personaje")
##		PLAYER.take_damage()
##		var player = area.get_parent()
##		player.hp -= 2
##		if !player.is_destroying: player.camera.shake(0.25, 10, 30)
##		hide()
#		disconnect("area_entered", self, "_on_StaticBody2D_area_entered")
#		$Position2D.position = Vector2.ZERO
##		$destroy_sound.stream = load("res://Assets/Sounds/bullet_destroy_sound/"+str((randi() % 3)+1)+".wav")
##		$destroy_sound.play()
