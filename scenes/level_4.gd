extends Node2D

func _on_ready() -> void:
	Levels.current_level = 3
	Levels.next_level_scene = "res://scenes/thanks.tscn"
	Ball.strokes = 0
