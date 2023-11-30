extends CharacterBody2D

var speed : int = 600

func _physics_process(delta) -> void:
	if Global.modo_players == 0:
		velocity.y = Global.get_axis2().y * -speed
	if Global.modo_players == 1:
		velocity.x = Global.get_axis2().x * -speed
		velocity.y = Global.get_axis2().y * -speed
	move_and_collide(velocity * delta)
