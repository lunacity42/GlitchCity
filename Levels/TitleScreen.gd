extends Node2D

var timeElapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Theme song".play()
	
func _input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://Levels/LevelOffice.tscn")

func _process(delta):
	if timeElapsed > 0.5:
		$CanvasLayer/Label.visible = not $CanvasLayer/Label.visible
		timeElapsed = 0
	timeElapsed += delta
