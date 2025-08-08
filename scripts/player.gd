extends CharacterBody2D

const BASE_SPEED = 1200
const SLOWDOWN_SPEED = 200
const BOUNCE_LOSS = 0.4 # 0.4 -> 40 % speed loss on bounce
const AIM_DEADZONE = 0.2

const INPUT_METHOD = "controller"

var direction = Vector2i(0, 0)
@onready var arrow: Sprite2D = $Arrow

const ARROW_GRADIENT = preload("res://assets/arrow_gradient.tres")

var last_pos = Vector2.ZERO
var last_velocity = Vector2.ZERO

func _ready() -> void:
	InputMap.action_set_deadzone("left", AIM_DEADZONE)
	InputMap.action_set_deadzone("right", AIM_DEADZONE)
	InputMap.action_set_deadzone("up", AIM_DEADZONE)
	InputMap.action_set_deadzone("down", AIM_DEADZONE)
	Ball.last_position = global_position
	Ball.stopped = false
	last_pos = global_position

func _physics_process(delta: float) -> void:
	print(Ball.strokes)
	if last_velocity == velocity:
		Ball.velocity = last_velocity
	else:
		last_velocity = velocity
	
	if Ball.velocity != last_velocity:
		velocity = Ball.velocity
	
	# x and y
	var inputs = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	var confirmed = Input.is_action_just_pressed("shoot")

	if velocity.x == 0.0 and velocity.y == 0.0 and last_pos == global_position:
		if Ball.stopped == false:
			Ball.current_position = global_position
			
		Ball.stopped = true

	last_pos = global_position
	
	# handle arrow showing only when aiming
	if Ball.stopped == true and (inputs.x != 0.0 or inputs.y != 0.0):
		arrow.show()
		# distance from joystick middle
		var distance_from_middle = sqrt(inputs.x ** 2 + inputs.y ** 2)
		arrow.scale = Vector2((1 +distance_from_middle)**2 + clamp(distance_from_middle, 0.0, 1.0), arrow.scale.y)
		arrow.modulate = Color(ARROW_GRADIENT.sample(distance_from_middle))
	else:
		arrow.hide()

	if Ball.stopped:
		global_position = Ball.current_position
		if INPUT_METHOD == "controller":
			look_at(position + inputs.normalized())
		else:
			look_at(get_global_mouse_position())

		
		if confirmed:
			Ball.strokes += 1
			Ball.stopped = false
			velocity.x = BASE_SPEED * inputs.x
			velocity.y = BASE_SPEED * inputs.y

			if inputs.x < 0: # left
				direction.x = -1
			elif inputs.x > 0: #right
				direction.x = 1
			elif inputs.y < 0: #up
				direction.y = -1
			elif inputs.y > 0: #down
				direction.y = 1

	var collision = move_and_collide(velocity * delta)
	
	if not Ball.stopped:
		velocity = velocity.move_toward(Vector2.ZERO, SLOWDOWN_SPEED * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * (1-BOUNCE_LOSS)
	
	Ball.velocity = velocity
