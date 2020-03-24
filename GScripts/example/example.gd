extends GameScript

func _ready():
	_handle_events(true)
	Console.sendMessage("[ [color=lime]![/color] ] [b]Example Script is ready[/b]")

# warning-ignore:unused_argument
func _onCommand(event: GameEvent, command: String, args: Array = []) -> void:
	if command == "hello":
		if args[0] == "world":
			Console.sendMessage("hell on you")
			print(Console.console_text.get_line_count())
			return
	var expression: Expression = Expression.new()
	var error = expression.parse(command, [])
	if error != OK:
		print(expression.get_error_text())
		return
	#the statment below is unsupported
	#Console.sendMessage(str(expression.execute([command])))
