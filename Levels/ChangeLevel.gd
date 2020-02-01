extends Area2D



func _on_ChangeLevel_body_entered(body):
	print("heuifsd")
	get_tree().change_scene("res://Levels/LevelOffice2.tscn")
