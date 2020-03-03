extends Node

class_name GameScript

#GameScript class properties
var enabled: bool = false

#GameScript data information
var script_name: String
var version: String
var authors: Array
var description: String

static func get_script_config() -> ConfigFile:
	var file: File = File.new()
	if file.file_exists("./script.cfg"):
		var config: ConfigFile = ConfigFile.new()
		config.load("./script.cfg")
		return config
	return ConfigFile.new()
	"""
	return the GameScript config file 'script.cfg'
	which usualy located in the same GameScript directory
	"""
