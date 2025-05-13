@tool
extends VBoxContainer

@onready var prefix_line_edit = $PrefixLineEdit
@onready var rename_button = $RenameButton

func _ready():
	rename_button.pressed.connect(_on_rename_pressed)

func _on_rename_pressed():
	print("Button pressed!")
	
	var new_prefix = prefix_line_edit.text
	
	# Use direct scene access
	var scene = get_tree().edited_scene_root
	if scene:
		var animation_players = find_animation_players(scene)
		print("Found", animation_players.size(), "AnimationPlayer nodes in scene")
		
		for player in animation_players:
			print("Processing AnimationPlayer:", player.name)
			rename_tracks(player, new_prefix)
	else:
		print("No scene is currently being edited!")

func find_animation_players(node):
	var players = []
	
	if node is AnimationPlayer:
		players.append(node)
	
	for child in node.get_children():
		players.append_array(find_animation_players(child))
	
	return players

func rename_tracks(anim_player: AnimationPlayer, new_prefix: String):
	var changed = false
	for anim_name in anim_player.get_animation_list():
		var anim = anim_player.get_animation(anim_name)
		print("Checking animation:", anim_name, "with", anim.get_track_count(), "tracks")
		
		for i in range(anim.get_track_count()):
			# Check if this is a track we want to rename
			# Get the full path as a string safely
			var path_str = ""
			
			# Try different methods depending on Godot version
			var path = anim.track_get_path(i)
			
			# Method 1: Direct string conversion
			path_str = String(path)
			print("Track path:", path_str)
			
			if path_str.begins_with("%"):
				var colon_idx = path_str.find(":")
				if colon_idx > 0:
					var rest = path_str.substr(colon_idx) # includes the colon
					var new_path = "%" + new_prefix + rest
					print("Renaming from", path_str, "to", new_path)
					anim.track_set_path(i, NodePath(new_path))
					changed = true
	
	if changed:
		anim_player.property_list_changed_notify()
		print("Tracks renamed!")
	else:
		print("No tracks needed renaming. Make sure your animation tracks start with % and contain a colon.")
