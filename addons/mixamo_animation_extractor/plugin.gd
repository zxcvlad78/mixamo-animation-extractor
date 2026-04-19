@tool
extends EditorPlugin

var context_menu_plugin: EditorContextMenuPlugin

func _enter_tree():
	var context_menu_script = load(get_script_path("extractor.gd"))
	if context_menu_script:
		context_menu_plugin = context_menu_script.new()
		add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_FILESYSTEM, context_menu_plugin)

func _exit_tree():
	remove_context_menu_plugin(context_menu_plugin)
func get_dir() -> String:
	return (get_script() as Script).resource_path.get_base_dir()

func get_script_path(script_name:String) -> String:
	return get_dir().path_join(script_name)
