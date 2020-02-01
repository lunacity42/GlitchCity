extends Popup

onready var display = $VBoxContainer/DisplayContainer/Display

var key_word = ["c","o","d","e"]
var guess = []

signal code_correct

func _on_GlitchPuzzle_code_correct():
	print("code correct")

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
	display.text = PoolStringArray(guess).join("")

func reset_lock():
	display.text = ""
	guess.clear()









