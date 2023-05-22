extends Node2D

func _ready():
	Global.change_level(true)
	
func _process(delta):
	$TextureProgress.value = Global.get_vidaBoss();
