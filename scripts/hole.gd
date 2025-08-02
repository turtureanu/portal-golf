extends Area2D
@onready var hole: Area2D = $"."
@onready var timer: Timer = $"../NextLevelTimer"

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
	timer.start()
