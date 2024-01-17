extends PanelContainer

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("pause_menu"):
		toggle_menu()


func toggle_menu():
		get_tree().paused = !get_tree().paused
		visible = !visible




func _on_close_button_toggled(toggled_on):
	
	#get_tree().paused = !get_tree().paused
	#visible = !visible
	toggle_menu()
	$MarginContainer/VBoxContainer/CloseButton.button_pressed = false
	pass # Replace with function body.
