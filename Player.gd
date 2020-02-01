extends KinematicBody2D

const SPEED = 15
const MAX_SPEED = 150
const FRICTION = 0.1

var motion = Vector2()

func _physics_process(delta):
	update_movement()
	move_and_slide(motion)

func update_movement():
	
	if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
#		$AudioStreamPlayer2D.play()
		if Input.is_action_pressed("move_left"):
			rotation_degrees = -45
		elif Input.is_action_pressed("move_right"):
			rotation_degrees = 45
		else:
			rotation_degrees = 0
	elif Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
#		$AudioStreamPlayer2D.play()
		if Input.is_action_pressed("move_left"):
			rotation_degrees = 225
		elif Input.is_action_pressed("move_right"):
			rotation_degrees = 135
		else:
			rotation_degrees = 180
	else:
		motion.y = 0

	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
#		$AudioStreamPlayer2D.play()
		if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			rotation_degrees = 270
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
#		$AudioStreamPlayer2D.play()
		if not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			rotation_degrees = 90
	else:
		motion.x = 0
	
	if motion.y != 0 or motion.x != 0:
		if $Footsteps.playing == false:
			$Footsteps.playing = true
	elif motion.y == 0 and motion.x == 0:
		$Footsteps.playing = false
