extends Node2D

var POSICION_INICIAL_JUGADOR1 = Vector2(100,360)
var POSICION_INICIAL_JUGADOR2 = Vector2(1180,360)
var POSICION_INICIAL_BOLA = Vector2(640,360)

func _ready():
	$player1.position = POSICION_INICIAL_JUGADOR1
	$player2.position = POSICION_INICIAL_JUGADOR2
	$ball.visible = false
	$ball2.visible = false
	$ball/CollisionShape2D.disabled = true
	$ball2/CollisionShape2D.disabled = true
	
	if Global.tipo_ball == 0:
		$ball.position = POSICION_INICIAL_BOLA
		$ball.visible = true
		$ball/CollisionShape2D.disabled = false
	if Global.tipo_ball == 1:
		$ball2.position = POSICION_INICIAL_BOLA
		$ball2.visible = true
		$ball2/CollisionShape2D.disabled = false
