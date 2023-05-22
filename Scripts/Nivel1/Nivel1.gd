extends Node2D

var width = 17000
var width_init = 2500
var hight = 1080
var hight_max = 500
var hight_min = 600

# Cantidad de powerUps en el nivel
var amount_powerUp = 5

# Probabilidad de que cada powerUp aparezca
var _powerups = {
	"heart": {"Probability":0.15, "Range": [0, 0.15]},
	"shot_triple": {"Probability":0.30, "Range": [0.15, 0.45]},
	"shot_doble": {"Probability": 0.55, "Range": [0.45, 1]}}

# Funcion para crear la cantidad de powerups en el nivel
# amount_powerUp: Cantidad de power que se van a crear
# random_num: Número pseudoaletorio distribución normal 
func _ready():
	randomize()
	var my_random = Global.linear_congruence(1,4,3,7,0,1,amount_powerUp)
	for i in range(amount_powerUp):
		var random_num = my_random[i][2]
		if random_num <= _powerups.get("heart").get("Range")[1]:
			create_powerUpHeart()
		elif random_num > _powerups.get("shot_doble").get("Range")[0] and random_num <= _powerups.get("shot_doble").get("Range")[1]:
			create_powerUpDoubleShoot()	
		elif random_num > _powerups.get("shot_triple").get("Range")[0]:
			create_powerUpShoot()	
#		print(my_random[i][2])

# create_powerUpShoot(): Función para crear powerUp de disparo triple
func create_powerUpShoot():
	var powerup_heart = preload("res://Scenes/PowerUps/PowerUp.tscn").instance()
	var location = Vector2()
	location.x = rand_range(width_init,width)
	location.y = rand_range(hight_min,hight_max)
	print(location)
	powerup_heart.position = location
	add_child(powerup_heart)

# create_powerUpDoubleShoot(): Función para crear powerUp de disparo doble
func create_powerUpDoubleShoot():
	var powerup_heart = preload("res://Scenes/PowerUps/DoubleShoot.tscn").instance()
	var location = Vector2()
	location.x = rand_range(width_init,width)
	location.y = rand_range(hight_min,hight_max)
	print(location)
	powerup_heart.position = location
	add_child(powerup_heart)

# create_powerUpHeart(): Función para crear powerUp de vidas
func create_powerUpHeart():
	var powerup_heart = preload("res://Scenes/PowerUps/FullVida.tscn").instance()
	var location = Vector2()
	location.x = rand_range(width_init,width)
	location.y = rand_range(hight_min,hight_max)
	print(location)
	powerup_heart.position = location
	add_child(powerup_heart)
	

func create_location():
	var location = Vector2()
	location.x = rand_range(width_init,width)
	location.y = rand_range(hight_min,hight_max)
	return location
	
