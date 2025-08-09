extends Node2D

func _on_ready() -> void:
	Levels.current_level = 1
	Levels.next_level_scene = "res://scenes/level-1.tscn"
	Ball.strokes = 0
	Levels.level_strokes = 2
