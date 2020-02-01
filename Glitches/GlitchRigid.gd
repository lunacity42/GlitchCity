extends Area2D

var in_glitch_area = false

func _on_GlitchRigid_body_entered(body):
	in_glitch_area = true
	$GlitchHum.playing = true

func _on_GlitchRigid_body_exited(body):
	in_glitch_area = false
	$GlitchHum.playing = false
	$CanvasLayer/GlitchPuzzle.hide()


func _on_GlitchRigid_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and in_glitch_area:
		print("yay")
		$CanvasLayer/GlitchPuzzle.popup_centered()
