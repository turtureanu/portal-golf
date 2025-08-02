extends Control

@onready var main_menu: Button = $Panel/HBoxContainer/MainMenu
@onready var continue_button: Button = $Panel/HBoxContainer/Continue


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	


func _on_visibility_changed() -> void:
	if visible:
		continue_button.grab_focus()
