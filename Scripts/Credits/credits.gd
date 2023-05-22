extends ParallaxBackground

var DIR = Vector2(0,-1)
var speed = 500

func _physics_process(delta):
	scroll_base_offset += DIR * speed * delta
