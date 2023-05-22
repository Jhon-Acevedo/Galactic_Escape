extends KinematicBody2D
class_name PLAYER

export (int) var velocidad = 600

onready var Disparo = preload("res://Scenes/Disparo.tscn")
onready var DisparoEspecial = preload("res://Scenes/DisparoEspecial.tscn")
onready var DisparoDoble = preload("res://Scenes/DoubleShoot.tscn")
onready var HUD = get_tree().get_nodes_in_group("hud")[0]
onready var playback = $AnimationTree.get("parameters/playback")

var movimiento = Vector2(0,0)
var cooldown = true
var powerup = false
var isTripleShoot = false

func _ready():
	Global.vidas = 3
	Global.LabelPuntos = HUD.get_node("BarraPuntos/Label")

func get_inputs():
	movimiento = Vector2()
	if Input.is_action_pressed("move_right"):
		movimiento.x += velocidad
		playback.travel("move_right")
	if Input.is_action_pressed("move_left"):
		movimiento.x -= velocidad
		playback.travel("move_left")
	if Input.is_action_pressed("move_up"):
		movimiento.y -= velocidad
	if Input.is_action_pressed("move_down"):
		movimiento.y += velocidad
	if Input.is_action_pressed("attack"):
		disparar()
	if movimiento == Vector2():
		playback.start("RESET")

func disparar():
	if cooldown:
		cooldown = false
		$Timer.start()
		$AudioStreamPlayer.play()
		var instancia_disparo 
		if powerup:
			if isTripleShoot:
				instancia_disparo = DisparoEspecial.instance()
			else:
				instancia_disparo = DisparoDoble.instance()
		else:
			instancia_disparo = Disparo.instance()
		instancia_disparo.global_position = $DisparoPos.global_position
		add_child(instancia_disparo)
		instancia_disparo.set_as_toplevel(true)

func _physics_process(_delta):
	if !Global.cinematica:
		get_inputs()
		movimiento = move_and_slide(movimiento)
		if is_on_wall():
			pass
			#take_damage()
		

func _process(delta):
	pass
		
func take_damage():
	Global.remove_vida()
	var barra_vida = HUD.get_node("BarraVida")
	var vidas = barra_vida.get_children()
	vidas[Global.vidas].visible = false
	$DamageAnim.play("take_damage")

func up_vida():
	var barra_vida = HUD.get_node("BarraVida")
	var vidas = barra_vida.get_children()
	vidas[1].visible = true
	vidas[2].visible = true
	#vidas[Global.vidas].visible = false

func _on_Timer_timeout():
	cooldown = true
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("enemigo"):
		take_damage()
		area.set_explosion()
	if area.is_in_group("bullet_enemy"):
		take_damage()
	pass # Replace with function body.


func _on_PowerUp_area_entered(area):
	if area.is_in_group("enemigo"):
		take_damage()
		area.set_explosion()
	pass # Replace with function body.
