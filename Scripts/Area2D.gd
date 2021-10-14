extends Area2D

export(String, FILE) var next_world

func _on_Area2D_body_entered(_body):
	get_tree().change_scene(next_world)
