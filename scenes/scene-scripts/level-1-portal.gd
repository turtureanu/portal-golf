extends "res://scripts/portal.gd"


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.set_position($Destination.global_position)
		Ball.velocity.y *= -1
		body.velocity.y *= -1
