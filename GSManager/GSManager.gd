extends Node

export(String) var gscripts_dir = "./GScripts" #Main scripts directory

var scripts: Array = []

func _ready() -> void:
	load_scripts()
	
func load_scripts() -> void:
	var dir: Directory = Directory.new()
	if dir.open(gscripts_dir) == OK:
		
# warning-ignore:return_value_discarded
		
		dir.list_dir_begin()
		var file = dir.get_next()
		while file != "":
			var path_to_config: String = file + "/settings.cfg"
			if dir.current_is_dir() && dir.file_exists(path_to_config):
				if !valid_gscript_config(path_to_config):
					print("non valid")
					return
				var config: ConfigFile = ConfigFile.new()
# warning-ignore:return_value_discarded
				config.load(gscripts_dir + "/"+ path_to_config)
				var main: String = gscripts_dir + "/" + file + "/" + config.get_value('default', 'main')
				var script: Resource = get_gscript(main)
				if is_instance_valid(script.new()):
					print("valid")
					var gscript: GameScript = script.new()
#						config.get_value('default', 'name')
#						config.get_value('default', 'version'),
#						config.get_value('default', 'authors'),
#						config.get_value('default', 'description')
					add_gscript(gscript)
		
			file = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")

func add_gscript(script: GameScript) -> void:
	scripts.append(script)
	$Scripts.add_child(script)
	print(script.name + "gamme script added with no error")
	print(script.version)
	print("script authors: " + script.authors)

func get_gscript(path: String) -> Resource:
	return load(path)

func valid_gscript_config(path: String) -> bool:
	var config: ConfigFile = ConfigFile.new()
	var full_path: String = gscripts_dir + "/" + path
	var err: int = config.load(full_path)
	print(full_path)
	if err == OK && config.has_section_key('default', 'main'):
		var main_gscript: String = config.get_value('default', 'main')
		var file: File = File.new()
		print(full_path.replace("settings.cfg", "") +  main_gscript)
		if file.file_exists(full_path.replace("settings.cfg", "") +  main_gscript):
			return true
	return false
