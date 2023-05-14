extends Node2D


func _physics_process(_delta):
	if get_child_count() == 0:
		queue_free()
