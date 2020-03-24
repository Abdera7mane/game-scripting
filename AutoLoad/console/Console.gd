extends WindowDialog

const MESSAGE_FORMAT: Dictionary = {
	0: "%s",
	1: "[color=yellow]%s[/color]",
	2: "[color=red]%s[/color]"
}

onready var console_text: RichTextLabel = $View/MarginContainer/Panel/RichTextLabel

enum MessageType {DEFAULT_MESSAGE = 0, WARNNING_MESSAGE = 1, ERROR_MESSAGE = 2}

func _ready() -> void:
	call_deferred("popup")

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _onCommand(event: GameEvent, command: String, args: Array) -> void:
	if command == "" or command.begins_with(" "):
		return
	if DefaultCommandMap.getCommand(command) == null:
		sendMessage("Command not found", MessageType.ERROR_MESSAGE)
		return
	var success: bool = DefaultCommandMap.getCommand(command).execute(args)
	if !success:
		sendMessage("an Error occured while executing '%s'" % command, MessageType.ERROR_MESSAGE)
	
func sendMessage(message: String, type: int = MessageType.DEFAULT_MESSAGE) -> void:
	var format: String = MESSAGE_FORMAT.get(type)
	var _err: int = console_text.append_bbcode(format % message + "\n") #[/b][/i][/u][/s][/code][/center][/right][/fill][/indent][/url][img][/font][/color]
#	console_text.pop()
	
