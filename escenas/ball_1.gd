extends RigidBody2D

var speed : int = 300
var ultima_colision
var velocidad_minima : int = 300
var ultimo_jugador_golpeado : String
var visible_en_escena : bool = true

func _ready() -> void:
	$CollisionShape2D.disabled = true

func _physics_process(delta) -> void:
	var  info_colision = move_and_collide(linear_velocity.normalized() * speed * delta)
	if linear_velocity.length() < velocidad_minima:
		linear_velocity = linear_velocity.normalized() * velocidad_minima
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
	print("si")
	linear_velocity *= 0
	await get_tree().create_timer(0.5).timeout
	linear_velocity.x = Global.numero_random()
	linear_velocity.y = Global.numero_random()
	$CollisionShape2D.disabled = false
	linear_velocity *= speed

func sumar_score() -> void:
	if ultima_colision == "StaticBodyDerecha" or position.x > 1280:
		Global.scoreP1 += 1
		Global.valor_barra_P1 += 1
	if ultima_colision == "StaticBodyIzquierda" or position.x < 0:
		Global.scoreP2 += 1
		Global.valor_barra_P2 += 1
