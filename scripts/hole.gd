extends Area2D
@onready var hole: Area2D = $"."
@onready var timer: Timer = $"../NextLevelTimer"

func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int,_local_shape_index: int) -> void:
	if body.is_in_group("Ball"):
		body.queue_free()
	timer.start()
	
@onready var next_level_menu: Control = $"../NextLevelMenu"

func _on_next_level_timer_timeout() -> void:
	# add new level to unlocked levels
	Levels.unlocked_levels.append(Levels.unlocked_levels[-1] + 1)
	
	next_level_menu.show()
	
