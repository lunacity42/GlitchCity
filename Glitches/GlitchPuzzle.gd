extends Popup

onready var label = $VBoxContainer/DisplayContainer/NinePatchRect/VBoxContainer/Label
onready var original_text = label.text
onready var fill_in_text = PoolStringArray(label.text.split("*", false))

var key_word = ["f", "l", "i", "p"]
var guess = []

signal code_correct

#func _on_GlitchPuzzle_code_correct():
#	print("code correct")
#	hide()

func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])

func Button_pressed(button):
	if button == "ok":
		check_guess()
	elif button == "del":
		reset_lock()
	else:
		enter(button)

func check_guess():
	if guess == key_word:
		emit_signal("code_correct")
	else:
		reset_lock()

func enter(button):
	guess.append(button)
	update_display()

func update_display():
	label.text = fill_in_text[0] + PoolStringArray(guess).join("") + count_remaining_asterisks() + fill_in_text[1]
	
func count_remaining_asterisks():
	var remaining_asterisks = ""
	for _i in range(key_word.size() - guess.size()):
		remaining_asterisks += "*"
	return remaining_asterisks

func reset_lock():
	label.text = original_text
	guess.clear()

