extends VBoxContainer

func _ready():
	visible = true

func _on_About_pressed():
	visible = false

func _on_Back_pressed():
	visible = true
