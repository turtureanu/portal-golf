extends Node

var current_position = Vector2(0, 0)
var last_position = Vector2(0, 0)
var stopped = true
var velocity = Vector2(0,0)
var strokes = 0
var using_controller = bool(len(Input.get_connected_joypads()))
