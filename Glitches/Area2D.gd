extends Area2D

func _on_Area2D_body_entered(body):
	$GlitchHum.playing = true

func _on_Area2D_body_exited(body):
	$GlitchHum.playing = false
