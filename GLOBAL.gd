extends Node

var axis1 : Vector2
var axis2 : Vector2
var keys_p1 : Array
var keys_p2 : Array
var scoreP1 : int = 0
var scoreP2 : int = 0
var total : int = 0
var behaviors_ball : Array = [0,0]
var ultima_colision_pelota : String = ""
var tipo_ball : int = 0
var modo_players : int = 0
var modo_score : int = 0
var lista_int : Array = [-1,1]
var tiempo_de_juego : int = 0
var cantidad_pelotas : int = 1
var valor_barra_P1 : int = 0
var valor_barra_P2 : int = 0

func _ready() -> void:
	keys_p1 = [KEY_A, KEY_D, KEY_W, KEY_S]
	keys_p2 = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN]

func _input(_event) -> void:
	if Input.is_action_just_released("ui_cancel"):
		if get_tree().current_scene.name == "escena_juego":
			get_tree().change_scene_to_file("res://escenas/main.tscn")

func numero_random() -> int:
	var random = lista_int[randi() % lista_int.size()]
	return random

func get_axis1() -> Vector2:
	axis1.x = int(Input.is_key_pressed(keys_p1[0])) - int(Input.is_key_pressed(keys_p1[1]))
	axis1.y = int(Input.is_key_pressed(keys_p1[2])) - int(Input.is_key_pressed(keys_p1[3]))
	return axis1.normalized()

func get_axis2() -> Vector2:
	axis2.x = int(Input.is_key_pressed(keys_p2[0])) - int(Input.is_key_pressed(keys_p2[1]))
	axis2.y = int(Input.is_key_pressed(keys_p2[2])) - int(Input.is_key_pressed(keys_p2[3]))
	return axis2.normalized()
