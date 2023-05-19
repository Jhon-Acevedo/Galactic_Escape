extends Node2D

var width = 9000
var width_init = 4000
var hight = 1080
var location = Vector2()

# Cantidad de powerUp en el nivel 1
var amount_powerUp = 5

# Instancias de los powerUps
var powerup_heart = preload("res://Scenes/PowerUps/FullVida.tscn").instance()
var powerup_shot_triple = preload("res://Scenes/PowerUps/PowerUp.tscn").instance()

# Probabilidad de que cada powerUp aparezca
var _powerups = {
	"heart": {"Probability":0.2},
	"shot_triple": {"Probability":0.5},
}

# Funcion para crear la cantidad de powerups en el nivel
# amount_powerUp: Cantidad de power que se van a crear
# random_num: Número pseudoaletorio distribución normal 
# create_powerUpHeart(): Función para crear powerUp de vidas
# create_powerUpShoot(): Función para crear powerUp de disparo triple
func _ready():
	var my_random = Global.linear_congruence(1,4,3,7,0,1,amount_powerUp)
	randomize()
	for i in range(amount_powerUp):
		var random_num = my_random[i][2]
		if random_num <= _powerups.get("heart").get("Probability"):
			create_powerUpHeart()
		if random_num <= _powerups.get("shot_triple").get("Probability"):
			create_powerUpShoot()
#		print(random_num)


func create_powerUpShoot():
	var powerup_heart = preload("res://Scenes/PowerUps/PowerUp.tscn").instance()
	location.x = rand_range(2500,width)
	location.y = rand_range(550,550)
	powerup_heart.position = location
	add_child(powerup_heart)
	

func create_powerUpHeart():
	var powerup_heart = preload("res://Scenes/PowerUps/FullVida.tscn").instance()
	location.x = rand_range(2500,width)
	location.y = rand_range(550,550)
	powerup_heart.position = location
	add_child(powerup_heart)
	

func create_location():
	location.x = rand_range(width_init,width)
	location.y = rand_range(1,hight)
	return location
	

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
