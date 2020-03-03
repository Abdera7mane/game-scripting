extends Object

class_name GameEvent

var name: String
var state: bool setget set_state, get_state

func _init(name: String, state: bool = false) -> void:
	self.name = name
	self.state = state

func set_state(value: bool) -> void:
	state = value

func get_state() -> bool:
	return state
