extends Object

class_name GameEvent

var name: String
var cancelled: bool setget set_cancelled, is_cancelled

# warning-ignore:shadowed_variable
func _init(name: String, state: bool = false) -> void:
	self.name = name
	self.cancelled = state

func set_cancelled(value: bool) -> void:
	cancelled = value

func is_cancelled() -> bool:
	return cancelled
