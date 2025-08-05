extends Control

@onready var menu_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/MenuButton
@onready var next_level_button: Button = $Panel/MarginContainer/VBoxContainer/HBoxContainer/NextLevelButton
@onready var level_complete: Label = $Panel/MarginContainer/VBoxContainer/LevelComplete

func _on_visibility_changed() -> void:
	if visible and next_level_button:
		level_complete.text = str("Level ", Levels.current_level, " complete!")
		next_level_button.grab_focus()


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_next_level_button_pressed() -> void:
	get_tree().change_scene_to_file(Levels.next_level_scene)
