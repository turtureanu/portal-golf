extends Area2D

var is_in_area = false


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("Ball"):
		is_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Ball"):
		is_in_area = false
		
func _physics_process(_delta: float) -> void:
	if is_in_area:
		if Ball.stopped == true:
			Ball.current_position = Ball.last_position
			
		if Ball.stopped == false and Ball.velocity == Vector2.ZERO:
			if Ball.current_position != Ball.last_position:
				Ball.last_position = Ball.current_position
