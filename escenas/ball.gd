extends CharacterBody2D

var speed : int = 300
var numRandom : int
var ultima_colision : String
var ultimo_jugador_golpeado : String
var incremento : float = 1

func _ready():
	start()

func _physics_process(delta):
	var  info_colision = move_and_collide(velocity * delta)
	if info_colision:
		ultima_colision = info_colision.get_collider().name
		velocity = velocity.bounce(info_colision.get_normal())
		if ultima_colision == "player1" or ultima_colision == "player2":
			ultimo_jugador_golpeado = ultima_colision
		sumar_score()
		print("ultima colision: " + ultima_colision)
		print("jugador: " + ultimo_jugador_golpeado)

func start():
	await get_tree().create_timer(2.0).timeout
	numRandom = randi_range(-1, 1)
	while numRandom == 0:
		numRandom = randi_range(-1, 1)
	velocity.x = numRandom
	velocity.y = numRandom
	velocity *= speed

func sumar_score():
	if ultima_colision == "StaticBodyDerecha":
		Global.scoreP1 += 1
	if ultima_colision == "StaticBodyIzquierda":
		Global.scoreP2 += 1
	#if ultima_colision == "StaticBodyDerecha" and ultimo_jugador_golpeado == "player1":
		#Global.scoreP1 += 1
		#Global.total += 1
	#if ultima_colision == "StaticBodyIzquierda" and ultimo_jugador_golpeado == "player2":
		#Global.scoreP2 += 1
		#Global.total -= 1

func activar_behaviors(interruptor):
	#  hacer crecer el shape
	if interruptor[0]:
		await get_tree().create_timer(1).timeout
		$CollisionShape2D.shape.radius += 1
