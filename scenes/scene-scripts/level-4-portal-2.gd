extends "res://scripts/portal.gd"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		body.set_position($Destination.global_position)
		var tmp1 = Ball.velocity.x
		Ball.velocity.x = Ball.velocity.y
		Ball.velocity.y = tmp1
		
		var tmp2 = body.velocity.x
		body.velocity.x = body.velocity.y
		body.velocity.y = tmp2
		
