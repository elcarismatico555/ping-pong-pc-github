extends Node2D

var POSICION_INICIAL_JUGADOR1 = Vector2(30,360)
var POSICION_INICIAL_JUGADOR2 = Vector2(1250,360)
var POSICION_INICIAL_BOLA = Vector2(640,360)
var escena_pelota : PackedScene = preload("res://escenas/ball_1.tscn")
var nodo_pelota : Node

func _ready() -> void:
	spawn_jugadores()
	añadir_pelotas_segun_cantidad_seleccionada()
#region -- SPAWNERS --

func spawn_jugadores() -> void:
	$player1.position = POSICION_INICIAL_JUGADOR1
	$player2.position = POSICION_INICIAL_JUGADOR2

func spawn_bola(numPelota) -> void:
	nodo_pelota = get_node("./ball" + str(numPelota))
	nodo_pelota.position = POSICION_INICIAL_BOLA
# -- endregion --

func activar_pelotas(numPelota):
	get_node("./ball" + str(numPelota)).start()

func añadir_pelotas_segun_cantidad_seleccionada() -> void:
	print(Global.cantidad_pelotas)
	for x in Global.cantidad_pelotas:
		x += 1
		add_child(escena_pelota.instantiate(),true)
		spawn_bola(x)
		activar_pelotas(x)
		await get_tree().create_timer(0.4).timeout
		print("pelota: " + str(x))
