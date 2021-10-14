extends Area2D

func _ready():
	visible = true

func _on_Orb_body_entered(_body):
	visible = false
