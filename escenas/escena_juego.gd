extends Node2D

var POSICION_INICIAL_JUGADOR1 = Vector2(30,360)
var POSICION_INICIAL_JUGADOR2 = Vector2(1250,360)
var POSICION_INICIAL_BOLA = Vector2(640,360)
var escena_pelota : PackedScene = preload("res://escenas/ball_1.tscn")
var instancia_pelota = escena_pelota.instantiate()

func _ready() -> void:
#	$ball.visible = false
	#$ball1.visible = false
#	$ball/CollisionShape2D.disabled = true
	#$ball1/CollisionShape2D.disabled = true
	spawn_jugadores()
	spawn_bola()
	añadir_pelotas_segun_cantidad_seleccionada()

func _process(_delta) -> void:
#	if !$ball.visible_en_escena or !$ball.visible_en_escena:
	if !$ball1.visible_en_escena:
		spawn_jugadores()
		await get_tree().create_timer(0.2).timeout
		respawn_bola()

func spawn_jugadores() -> void:
	$player1.position = POSICION_INICIAL_JUGADOR1
	$player2.position = POSICION_INICIAL_JUGADOR2

func spawn_bola() -> void:
#	if Global.tipo_ball == 0:
#		$ball.position = POSICION_INICIAL_BOLA
#		$ball.visible = true
#		$ball/CollisionShape2D.disabled = false
	if Global.tipo_ball == 1:
#		$ball1.position = POSICION_INICIAL_BOLA
#		$ball1.visible = true
#		$ball1/CollisionShape2D.disabled = false
		pass

func activar_pelotas():
	get_node("ball1").start()
	pass

func respawn_bola() -> void:
	#$ball.position = POSICION_INICIAL_BOLA
	if get_node_or_null("ball1") != null:
		$ball1.position = POSICION_INICIAL_BOLA
	if get_node_or_null("ball2") != null:
		$ball2.position = POSICION_INICIAL_BOLA
	if get_node_or_null("ball3") != null:
		$ball3.position = POSICION_INICIAL_BOLA
	if get_node_or_null("ball4") != null:
		$ball4.position = POSICION_INICIAL_BOLA
	if get_node_or_null("ball5") != null:
		$ball5.position = POSICION_INICIAL_BOLA

func añadir_pelotas_segun_cantidad_seleccionada() -> void:
	for x in Global.cantidad_pelotas:
		add_child(instancia_pelota,true)
		$ball1.position = POSICION_INICIAL_BOLA
		activar_pelotas()
		#await get_tree().create_timer(0.4).timeout
