extends Node2D

var width = 9000
var hight = 1080
#var amount_powerUp = 0
var amount_powerUp_heart = 0
var amount_powerUp_shot_triple = 0
var location = Vector2()


var powerup_heart = preload("res://Scenes/PowerUps/FullVida.tscn").instance()
var powerup_shot_triple = preload("res://Scenes/PowerUp.tscn").instance()

var _powerups = {
	"heart": {"Probability":0.2},
	"shot_triple": {"Probability":0.5},
}
	

func _ready():
	randomize()
	for i in range(25):
		var random_num = randf()
		if random_num <= _powerups.get("heart").get("Probability"):
			create_powerUpHeart()
			


func create_powerUpHeart():
	var powerup_heart = preload("res://Scenes/PowerUps/FullVida.tscn").instance()
	location.x = rand_range(2500,width)
	location.y = rand_range(550,550)
	powerup_heart.position = location
	print(location)
	add_child(powerup_heart)
	

# Codigo funcional para 1 powerUp
#func _ready():	
#	randomize()
#	amount_powerUp = randi() % 4 + 1
#	print(amount_powerUp)
#	for i in range(amount_powerUp):
#		var powerup = preload("res://Scenes/PowerUp.tscn").instance()
#		location.x = rand_range(1, width)
#		location.y = rand_range(1,hight)
#		powerup.position = location
#		add_child(powerup)
		
	
	
