extends Node

func _ready() -> void:
	#register the events in the scene tree
	for event in get_events():
		get_tree().add_user_signal(event)

func emit_signal(signal_name: String, target: Object = null, args: Array = []) -> void:

	var method: String = get_events().get(signal_name)
	var event: GameEvent = new_event(signal_name)
	var signal_args: Array = [event] + args

	if method == null or target == null:
		return

	get_tree().emit_signal(signal_name, signal_args)
	if target.has_method(method) && !event.is_cancelled():
		target.callv(method, signal_args)

static func get_events() -> Dictionary:
	return {
	'onCommand': '_onCommand'
	}

func new_event(name: String) -> GameEvent:
	var event: GameEvent = GameEvent.new(name)
	return event
