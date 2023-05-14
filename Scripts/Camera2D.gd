extends Camera2D

export (int) var velocidad = 250

func _physics_process(delta):
	if !Global.cinematica:
		position.x += velocidad*delta
