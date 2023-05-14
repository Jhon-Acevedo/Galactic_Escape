extends Path2D

export (float) var speed = 200

onready var recorridos = get_children()

var is_in_screen = false
	
func _physics_process(delta):
	if is_in_screen: 
		for recorrido in recorridos:
			if recorrido.get_class() == "PathFollow2D":
				recorrido.offset += speed*delta


func _on_VisibilityNotifier2D_screen_entered():
	is_in_screen = true
