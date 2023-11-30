extends StaticBody2D

var speed : int = 600

func _physics_process(delta) -> void:
	constant_linear_velocity.x = Global.get_axis1().x * -speed
	constant_linear_velocity.y = Global.get_axis1().y * -speed
	#velocity.x = Global.get_axis1().x * -speed
	#velocity.y = Global.get_axis1().y * -speed
	move_and_collide(constant_linear_velocity * delta)
