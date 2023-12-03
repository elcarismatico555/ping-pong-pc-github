extends RigidBody2D

var speed : int = 300
var numRandom : int
var ultima_colision
var velocidad_minima : int = 300
var ultimo_jugador_golpeado : String
var visible_en_escena : bool = true

func _physics_process(delta):
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

func _on_visible_on_screen_notifier_2d_screen_entered():
	visible_en_escena = true
	start()

func _on_visible_on_screen_notifier_2d_screen_exited():
	visible_en_escena = false

func start():
	linear_velocity *= 0
	await get_tree().create_timer(2.0).timeout
	numRandom = randi_range(-1, 1)
	while numRandom == 0:
		numRandom = randi_range(-1, 1)
	linear_velocity.x = numRandom
	linear_velocity.y = numRandom
	linear_velocity *= speed

func sumar_score():
	if ultima_colision == "StaticBodyDerecha":
		Global.scoreP1 += 1
	if ultima_colision == "StaticBodyIzquierda":
		Global.scoreP2 += 1
