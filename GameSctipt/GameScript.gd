class_name GameScript
extends Node

onready var EventHandler: Script = preload("../GameEvent/EventHandler.gd")

#GameScript class properties
var enabled: bool = false
var config_file: ConfigFile setget set_configuration #, get_configuration

#GameScript data information
var version: String
var authors: String
var description: String

# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(name: String = "none", version: String = "Unknown", authors: String = "Anonymous", description: String = "") -> void:
	self.name = name
	self.version = version
	self.authors = authors
	self.description = description

func set_configuration(config: ConfigFile) -> void:
	config_file = config

#func get_configuration() -> ConfigFile:
#	return config_file
#	"""
#	return the GameScript config file 'script.cfg'
#	which usualy located in the same GameScript directory
#	"""

func _handle_events(enable: bool) -> void:
	var methods: Dictionary = EventHandler.get_events()
	if enable:
		for event in methods:
			var method: String = methods.get(event)
			if has_method(method) and !is_connected(event, get_tree(), method):
				get_tree().call_deferred("connect", event, self, method)
	else:
		for event in methods:
			var method: String = methods.get(event)
			if has_method(method):
				get_tree().disconnect(event, self, method)
