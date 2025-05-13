Godot Track Renamer Plugin

Author: LightSpeedVersion: For My Son Kai I Love You

Description

Ever needed to rename all the tracks in your AnimationPlayer to match your Skeleton3D or GeneralSkeleton node? The Godot Track Renamer plugin simplifies this task, quickly renaming animation tracks based on a new prefix you specify. Ideal for managing animations in large projects or quickly adapting animations to new skeleton structures.

Features

Easy Renaming: Quickly rename animation tracks directly within the Godot Editor.

Scene-Aware: Automatically identifies all AnimationPlayer nodes in your current scene.

Flexible Prefix: Specify any prefix that matches your target skeleton or naming scheme.

Immediate Feedback: Prints detailed feedback to the Godot Output console for easy debugging and verification.

Installation

Download or clone the repository.

Copy the folder track_renamer into your Godot project's addons directory:

res://addons/track_renamer

Open your project in Godot and go to:

Project -> Project Settings -> Plugins

Enable the Godot Track Renamer plugin.

Usage

Once enabled, find the Track Renamer dock in the right-hand side of your Godot Editor.

Enter your desired prefix into the input field.

Click the Rename button.

Check Godot’s Output panel for results and confirmation.

Requirements

Godot Engine (v4.x recommended)

Notes

Tracks must follow the naming pattern %OldSkeleton:bone_name. The plugin specifically targets tracks starting with % and containing a colon.

License

This plugin is provided by LightSpeed. Use freely and modify as needed. Dedicated to my son Kai—I love you!
