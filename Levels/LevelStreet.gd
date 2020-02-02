extends Node2D

var waitfortimer = true

func wait():
	$Timer.wait_time = 5 # wait_time in seconds
	$Timer.start()
	waitfortimer = true

func _process(delta):
	if !waitfortimer: # checks if waitfortimer is false
		print("the end")
		get_tree().change_scene("res://Levels/End.tscn")

func _on_Timer_timeout():
	$Timer.stop()
	waitfortimer = false

func _on_GlitchSewer_area_cleared():
	$NPC_child.visible = true
	$GlitchTree.visible = true
	$GlitchSewer.visible = false
	$DialogueAreaSewer/DialogueBox.hide_dialogue()

func _on_GlitchTree_area_cleared():
	$TileMap2/Particles2D.visible = true
	wait()

