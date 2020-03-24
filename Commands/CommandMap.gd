class_name CommandMap
extends Node


var commands: Dictionary

func _ready() -> void:
# warning-ignore:return_value_discarded
	register("test", TestCommand.new())

func getCommand(command_name: String) -> Command:
	var command: Command = commands.get(command_name)
	return command

func getAllCommands() -> Array:
	return commands.values()

func register(alias: String, command: Command) -> bool:
	alias = alias.to_lower().strip_escapes()
	commands[alias] = command
	return true

class TestCommand extends Command:
# warning-ignore:unused_argument
	func execute(args: Array = []) -> bool:
		Console.sendMessage("hello")
		return true
