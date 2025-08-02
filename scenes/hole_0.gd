extends Node2D
@onready var next_level_menu: Control = $"../CanvasLayer/NextLevelMenu"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"
@onready var main_menu: Button = $Panel/HBoxContainer/MainMenu


func _on_next_level_timer_timeout() -> void:
	next_level_menu.show()
	canvas_layer.offset = get_viewport_rect().size / 2
