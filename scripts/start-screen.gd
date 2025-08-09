extends Control
@onready var input: Button = $Input

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level-0.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_v_box_container_ready() -> void:
	$MarginContainer/VBoxContainer/Play.grab_focus()

func _on_ready() -> void:
	if Input.get_connected_joypads():
		input.text = "Input: controller"
		Ball.using_controller = true
	else:
		input.text = "Input: mouse only"
		Ball.using_controller = false


func _on_input_pressed() -> void:
	if bool(len(Input.get_connected_joypads())):
		if Ball.using_controller == true:
			input.text = "Input: mouse only"
			Ball.using_controller = false
		else:
			input.text = "Input: controller"
			Ball.using_controller = true
