extends KinematicBody2D

var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if (is_on_floor()):
		velocity.x = lerp(0, velocity.x, pow(2, -10 * delta))
