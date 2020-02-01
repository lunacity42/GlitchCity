extends KinematicBody2D

const SPEED = 10
const MAX_SPEED = 100
const FRICTION = 0.1

var motion = Vector2()

func _physics_process(delta):
	update_movement()
	move_and_slide(motion)
	hack_glitch()

func update_movement():
	
	if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
		if Input.is_action_pressed("move_left"):
			rotation_degrees = -135
		elif Input.is_action_pressed("move_right"):
			rotation_degrees = -45
		else:
			rotation_degrees = -90
	elif Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
		if Input.is_action_pressed("move_left"):
			rotation_degrees = 135
		elif Input.is_action_pressed("move_right"):
			rotation_degrees = 45
		else:
			rotation_degrees = 90
	else:
		motion.y = 0

	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
		if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			rotation_degrees = 180
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
		if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			rotation_degrees = 0
	else:
		motion.x = 0

func hack_glitch():
	pass
