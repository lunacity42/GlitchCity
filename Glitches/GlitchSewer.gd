extends Area2D

var in_glitch_area = false
signal area_cleared

func _on_GlitchSewer_body_entered(body):
	in_glitch_area = true
	$GlitchHum.playing = true

func _on_GlitchSewer_body_exited(body):
	in_glitch_area = false
	$GlitchHum.playing = false
	$CanvasLayer/GlitchPuzzle.hide()

func _on_GlitchRigid_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and in_glitch_area:
		print("yay")
		$CanvasLayer/GlitchPuzzle.popup_centered()
	
func _input(event):
	if event.is_action_pressed("interact") and in_glitch_area:
		print("key pressed")
		$CanvasLayer/GlitchPuzzle.popup_centered()

func _on_GlitchPuzzle_code_correct():
	$CanvasLayer/GlitchPuzzle.hide()
	emit_signal("area_cleared")
	queue_free()





