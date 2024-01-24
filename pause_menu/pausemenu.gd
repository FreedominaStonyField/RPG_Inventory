extends PanelContainer

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("pause_menu"):
		toggle_menu()


func toggle_menu():
		get_tree().paused = !get_tree().paused
		visible = !visible
		$MarginContainer/VBoxContainer.get_child(0).grab_focus()
		for i in $MarginContainer/VBoxContainer.get_children():
			i.button_pressed = false




func _on_close_button_toggled(toggled_on):
	toggle_menu()


func _on_close_button_pressed():
	toggle_menu()
	pass # Replace with function body.
