extends Area2D

var in_dialogue_area = false

func _on_DialogueArea_body_entered(body):
	in_dialogue_area = true
	print("here we are")
	$DialogueBox.show_dialogue()

func _on_DialogueArea_body_exited(body):
	in_dialogue_area = false
	$DialogueBox.hide_dialogue()

