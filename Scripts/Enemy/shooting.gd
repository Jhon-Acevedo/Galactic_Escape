extends Area2D

#var explosion = preload("res://Prefabs/Explosion.tscn")

onready var animator = $animator
var hp = 70

onready var ray_cast = $RayCast2D

var player_g_position = Vector2()
onready var player : PLAYER

func _look_player_in_node(node:Node):
	for child in node.get_children():
		if child is PLAYER:
			player_g_position = child.get_global_position()
			player = child
			return
		else:
			pass
			if child.get_child_count() > 0:
				_look_player_in_node(child)
				


func _look_for_player():
	for child in get_tree().get_root().get_children():
		if child is PLAYER:
			player_g_position = child.get_global_position()
			player = child
			return
		else:
			pass
			if child.get_child_count() > 0:
				_look_player_in_node(child)

func _process(delta):
	
	$Position2D.set_as_toplevel(true)
	$Position2D.set_global_position(global_position)
	
	if player_g_position.x < global_position.x:
		$Sprites/Sprite.scale.y = 1
	else: 
		$Sprites/Sprite.scale.y = -1
	_look_for_player()
	if global_position.distance_to(player_g_position) <= 1920 and hp > 0:
		$Position2D.look_at(player_g_position)
		global_rotation = lerp_angle(global_rotation, $Position2D.global_rotation, 2*delta)
	
	if hp <= 0:
		$Timer.stop()
#		for i in 3:
#			add_child(explosion.instance())
#		player.score += 25
		animator.play("destroy")
		set_process(false)


func _on_animator_animation_finished(anim_name):
	if anim_name == "destroy": queue_free()


func take_damage():
	if Global.get_vida_boss() <= 0:
		queue_free()

func _on_enemy_body_entered(body):
	if body is PLAYER:
		print("player")
#		if not body.is_destroying:
#			body.velocity += -body.velocity * 3
#		for i in 3:
#			add_child(explosion.instance())
#		body.hp -= 20
#		player.score += 20
#		if !player.is_destroying: player.camera.priority_shake(1.5, 30.0, 50.0)
#		animator.play("destroy")
#	elif body.is_on_group("player_bullet"):
#		body.get_parent()._destroy()
#		hp -= 30

#var bullet = preload("res://Scenes/Boss/EnemyBullet.tscn")
var bullet = preload("res://Scenes/Boss/EnemyBullet.tscn")

func shoot():
	var new_bullet = bullet.instance()
	new_bullet.z_index = 1
	get_parent().add_child_below_node(self, new_bullet)
	new_bullet.global_rotation_degrees = global_rotation_degrees
	new_bullet.global_position = $Sprites/Sprite/bullets_out.global_position
	$shoot_sound.play()

func _on_Timer_timeout():
	if ray_cast.is_colliding():
		if ray_cast.get_collider() is PLAYER:
			shoot()
#	$Timer.wait_time = (rand_range(0.1, 0.5))
	$Timer.wait_time = (0.1)
	randomize()


func _on_enemy_area_entered(area):
	if area.is_in_group("player_bullet"):
		area.get_parent()._destroy()
#		hp -= 30
