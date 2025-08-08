extends Area2D

var is_in_area = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		is_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		is_in_area = false
	
func _physics_process(delta: float) -> void:
	if is_in_area:
		Ball.velocity = Ball.velocity.move_toward(Vector2.ZERO, delta * (abs(Ball.velocity.x) + abs(Ball.velocity.y)) * 8)
