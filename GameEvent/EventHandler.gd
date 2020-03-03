extends Node

signal onCommand
signal onEvent

var methods: Dictionary = {
	'onCommand': '_onCommand'
}

func emit_signal(signal_name: String, target: Object = null, args: Array = []) -> void:
	var method: String = methods.get(signal_name)
	if method == null or target == null:
		return
	var event = new_event(signal_name)
	var signal_args: Array = [event] + args
	.emit_signal(signal_name, signal_args)
	if target.has_method(method):
		connect(signal_name, target, method, signal_args)
		.emit_signal(signal_name)
		disconnect(signal_name, target, method)

func new_event(name: String) -> GameEvent:
	var event: GameEvent = GameEvent.new(name)
	return event
