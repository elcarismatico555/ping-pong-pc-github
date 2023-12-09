extends RigidBody2D

var speed : int = 100
var ultima_colision
#var velocidad_minima : int = 100
var ultimo_jugador_golpeado : String
var visible_en_escena : bool = true

func _ready() -> void:
	$".".visible = false
	$CollisionShape2D.disabled = true

func _physics_process(delta) -> void:
	var  info_colision = move_and_collide(linear_velocity.normalized() * speed * delta)
	if linear_velocity.length() < speed:
		linear_velocity = linear_velocity.normalized() * speed
	if info_colision:
		ultima_colision = info_colision.get_collider().name
		linear_velocity = linear_velocity.bounce(info_colision.get_normal())
		if ultima_colision == "player1" or ultima_colision == "player2":
			ultimo_jugador_golpeado = ultima_colision
		sumar_score()
		print("ultima colision: " + ultima_colision)
		#print("jugador: " + ultimo_jugador_golpeado)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	visible_en_escena = true
	#start()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	sumar_score()
	visible_en_escena = false

func start() -> void:
	print(get_node(".").name + " activada")
	linear_velocity *= 0
	linear_velocity.x = Global.numero_random()
	linear_velocity.y = Global.numero_random()
	$CollisionShape2D.disabled = false
	$".".visible = true
	linear_velocity *= speed

func sumar_score() -> void:
	if ultima_colision == "StaticBodyDerecha" or position.x > 1280:
		Global.scoreP1 += 1
		Global.valor_barra_P1 += 1
	if ultima_colision == "StaticBodyIzquierda" or position.x < 0:
		Global.scoreP2 += 1
		Global.valor_barra_P2 += 1
