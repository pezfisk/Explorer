extends Control

func _ready():
	$MainMenu.visible = true
	$LevelSelector.visible = false
	$LevelSelector/WorldSelector.visible = true
	$LevelSelector/World1.visible = false
	$LevelSelector/World2.visible = false
	$LevelSelector/World3.visible = false
	$LevelSelector/World4.visible = false

func _on_Level_Selector_pressed():
	$MainMenu.visible = false
	$LevelSelector.visible = true
	$LevelSelector/WorldSelector.visible = true
	$LevelSelector/World1.visible = false
	$LevelSelector/World2.visible = false
	$LevelSelector/World3.visible = false
	$LevelSelector/World4.visible = false

func _on_World1_pressed():
	$LevelSelector/World1.visible = true
	$LevelSelector/WorldSelector.visible = false

func _on_World2_pressed():
	$LevelSelector/World2.visible = true
	$LevelSelector/WorldSelector.visible = false

func _on_World3_pressed():
	$LevelSelector/World3.visible = true
	$LevelSelector/WorldSelector.visible = false

func _on_World4_pressed():
	$LevelSelector/World4.visible = true
	$LevelSelector/WorldSelector.visible = false

func _on_Back_pressed():
	$LevelSelector/WorldSelector.visible = false
	$MainMenu.visible = true

func _on_Level_1_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World1/World1.tscn')

func _on_Level_2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World1/World2.tscn')

func _on_Level_3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World1/World3.tscn')

func _on_Level_4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World1/World4.tscn')

func _on_Back_1_pressed():
	$LevelSelector/World1.visible = false
	$LevelSelector/WorldSelector.visible = true

func _on_Level_1_2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World2/World1.tscn')

func _on_Level_2_2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World2/World2.tscn')


func _on_Level_3_2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World2/World3.tscn')


func _on_Level_4_2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World2/World4.tscn')

func _on_Back_2_pressed():
	$LevelSelector/World2.visible = false
	$LevelSelector/WorldSelector.visible = true

func _on_Level_1_3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World3/World1.tscn')

func _on_Level_2_3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World3/World2.tscn')

func _on_Level_3_3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World3/World3.tscn')

func _on_Level_4_3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World3/World4.tscn')

func _on_Back_3_pressed():
	$LevelSelector/World3.visible = false
	$LevelSelector/WorldSelector.visible = true

func _on_Level_1_4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World4/World1.tscn')

func _on_Level_2_4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World4/World3.tscn')

func _on_Level_3_4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World4/World3.tscn')

func _on_Level_4_4_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene('res://Scenes/Maps/World4/World4.tscn')

func _on_Back_4_pressed():
	$LevelSelector/World4.visible = false
	$LevelSelector/WorldSelector.visible = true
