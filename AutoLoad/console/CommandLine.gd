extends LineEdit

signal send_command

func _gui_input(event: InputEvent) -> void:

	if event is InputEventKey:
		call_deferred("grab_focus")
		if !event.is_echo() && event.is_action_pressed("ui_accept"):
			event.set_echo(true)
			emit_signal("send_command", text)
			clear()
