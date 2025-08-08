extends Control

@onready var menu_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/MenuButton
@onready var next_level_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/NextLevelButton
@onready var level_complete: Label = $Panel/MarginContainer/VBoxContainer/LevelComplete

@onready var star_1: Sprite2D = $"Panel/MarginContainer/VBoxContainer/Star 1"
@onready var star_2: Sprite2D = $"Panel/MarginContainer/VBoxContainer/Star 2"
@onready var star_3: Sprite2D = $"Panel/MarginContainer/VBoxContainer/Star 3"

func _on_visibility_changed() -> void:
	if visible and next_level_button:
		level_complete.text = str("Level ", Levels.current_level, " complete!")
		if star_1 and star_2 and star_3:
			if Ball.strokes == Levels.level_strokes - 2:
				star_1.show()
			if Ball.strokes == Levels.level_strokes - 1:
				star_1.show()
				star_2.show()
			if Ball.strokes >= Levels.level_strokes:
				star_1.show()
				star_2.show()
				star_3.show()
			
		next_level_button.grab_focus()
	
	else:
		if star_1 and star_2 and star_3:
			star_1.hide()
			star_2.hide()
			star_3.hide()
		


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_next_level_button_pressed() -> void:
	get_tree().change_scene_to_file(Levels.next_level_scene)
