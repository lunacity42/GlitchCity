extends Area2D

var in_dialogue_area = false
var dialogue_content = "\"HEEEELP!! It smells bad here, and my shoes are all wet.\""

func _on_DialogueAreaSewer_body_entered(body):
	print("ok")
	in_dialogue_area = true
	$DialogueBox/Control/TextureRect/Label.text = dialogue_content
	$DialogueBox.show_dialogue()

func _on_DialogueAreaSewer_body_exited(body):
	in_dialogue_area = false
	$DialogueBox.hide_dialogue()
