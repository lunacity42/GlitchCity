extends Node2D

var area_cleared

func _on_GlitchRigid_area_cleared():
	print("clear")
	set_modulate("ffffff")
	area_cleared = true


func _on_ExitArea_body_entered(body):
	if area_cleared:
		get_tree().change_scene("res://Levels/LevelStreet.tscn")
