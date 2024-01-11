extends PanelContainer

func _input(event):
	if event.is_action_pressed("pause_menu"):
		get_tree().paused = !get_tree().paused
		visible = !visible


func _on_close_button_pressed():
		get_tree().paused = !get_tree().paused
		visible = !visible

