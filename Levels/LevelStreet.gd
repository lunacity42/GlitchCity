extends Node2D

func _on_GlitchSewer_area_cleared():
	$NPC_child.visible = true
	$GlitchTree.visible = true
	$GlitchSewer.visible = false

func _on_GlitchTree_area_cleared():
	$TileMap2/Particles2D.visible = true


