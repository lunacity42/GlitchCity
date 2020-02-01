extends Area2D

var in_dialogue_area = false
var dialogue_content = "2nd line of intro."

func _on_DialogueArea_body_entered(body):
	in_dialogue_area = true
	$DialogueBox/Control/TextureRect/Label.text = dialogue_content
	$DialogueBox.show_dialogue()

func _on_DialogueArea_body_exited(body):
	in_dialogue_area = false
	$DialogueBox.hide_dialogue()
