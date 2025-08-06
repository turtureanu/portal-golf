extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-2.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_v_box_container_ready() -> void:
	$MarginContainer/VBoxContainer/Play.grab_focus()
