extends "res://scripts/portal.gd"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.set_position($Destination.global_position)
		Ball.velocity.x *= -1
		body.velocity.x *= -1
