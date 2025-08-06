extends Node2D

func _on_ready() -> void:
	Levels.current_level = 0
	Levels.next_level_scene = "res://scenes/level-1.tscn"
