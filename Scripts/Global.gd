extends Node

var puntos = 0
var vidas = 3
var cinematica = false
var LabelPuntos 

var vidaBoss = 1000
var isLevel3 = false

func is_level3():
	return isLevel3

func change_level(value):
	isLevel3 = value

func get_vidaBoss():
	return vidaBoss

func remove_vida_boss():
	vidaBoss -= 10 
	if vidaBoss <= 0:
		puntos = 0
		isLevel3 = false
		get_tree().change_scene("res://Scenes/Credits.tscn")
	
func get_vida_boss():
	return vidaBoss

func remove_vida():
	if vidas > 1:
		vidas -= 1
	else: 
		puntos = 0
		isLevel3 = false
		get_tree().change_scene("res://Scenes/GameOver.tscn")

func add_vida():
	vidas = 3

	
func add_puntos(valor):
	puntos += valor
	LabelPuntos.text = String(puntos)
	

func get_vida():
	return vidas
	
# Funtion for create numbers pseudorandom "Linear Congruence"
func linear_congruence(my_x0, k, my_c, g, minium, maximum, iterations):
	var x0 = my_x0
	var a = 1 + 2 * k
	var c = my_c
	var m = int(pow(2,g))

	var arrayBidimensional = []
	for i in range(iterations):
		var fila = []
		for j in range(4):
			fila.append(0)
		arrayBidimensional.append(fila)

	for i in range(iterations):
		var x_i = ((a * x0) + c) % m
		var aux_x_i = x_i
		var number_r_i = float(aux_x_i) / (m - 1)
		var number_n_i = minium + (maximum - minium) * number_r_i

		x0 = x_i
		arrayBidimensional[i][0] = i + 1
		arrayBidimensional[i][1] = x_i
		arrayBidimensional[i][2] = number_r_i
		arrayBidimensional[i][3] = number_n_i
	return arrayBidimensional

