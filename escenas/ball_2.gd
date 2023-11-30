extends RigidBody2D

var speed : int = 300
var direccion : int
var numRandom
var ultima_colision
var ultimo_jugador_golpeado : String

func _ready():
	numRandom = randi_range(-1, 1)
	while numRandom == 0:
		numRandom = randi_range(-1, 1)
	direccion = numRandom
	start()

func _physics_process(delta):
	var  info_colision = move_and_collide(linear_velocity * delta)
	if info_colision:
		ultima_colision = info_colision.get_collider().name
		linear_velocity = linear_velocity.bounce(info_colision.get_normal())
		if ultima_colision == "player1" or ultima_colision == "player2":
			ultimo_jugador_golpeado = ultima_colision
		sumar_score()
		print("ultima colision: " + ultima_colision)
		#print("jugador: " + ultimo_jugador_golpeado)

func start():
	linear_velocity.x = numRandom
	linear_velocity.y = numRandom
	linear_velocity *= speed

func sumar_score():
	if ultima_colision == "StaticBodyDerecha":
		Global.scoreP1 += 1
	if ultima_colision == "StaticBodyIzquierda":
		Global.scoreP2 += 1
