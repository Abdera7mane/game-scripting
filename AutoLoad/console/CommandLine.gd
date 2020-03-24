extends LineEdit

func _on_CommandLine_gui_input(event: InputEvent) -> void:
	if event is InputEventKey:
		call_deferred("grab_focus")
		if !event.is_echo() && event.is_action_pressed("ui_accept"):
			event.set_echo(true)
			var args: Array = []
			var full_command: Array = text.split(" ")
			var command: String = full_command[0]
			for i in range(1, full_command.size()):
				args.append(full_command[i])
			Console.sendMessage("> " + text)
			get_node("/root/main").emit_signal("onCommand", Console, [command, args])
			clear()
