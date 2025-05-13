@tool
extends EditorPlugin

var track_renamer_panel

func _enter_tree():
	track_renamer_panel = preload("res://addons/track_renamer/track_renamer_panel.tscn").instantiate()
	
	# Add debug to verify the plugin is loaded correctly
	print("Track Renamer Plugin: Initialized")
	
	# Add the panel to the editor UI
	add_control_to_dock(DOCK_SLOT_RIGHT_UL, track_renamer_panel)

func _exit_tree():
	if track_renamer_panel:
		remove_control_from_docks(track_renamer_panel)
		track_renamer_panel.queue_free()
