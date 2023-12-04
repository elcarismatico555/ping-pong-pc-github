extends CharacterBody2D

var speed : int = 900

func _physics_process(delta) -> void:
	if Global.modo_players == 0:
		velocity.y = Global.get_axis1().y * -speed
	if Global.modo_players == 1:
		velocity.x = Global.get_axis1().x * -speed
		velocity.y = Global.get_axis1().y * -speed
	move_and_collide(velocity * delta)

func modificar_shape(modificacion):
	if $CollisionShape2DP1.shape.size.y > 40:
		if modificacion == "+":
			$CollisionShape2DP1.shape.size.y += 10
		if modificacion == "-":
			$CollisionShape2DP1.shape.size.y -= 10
	else:
		pass
	print(($CollisionShape2DP1).shape.size.y)
