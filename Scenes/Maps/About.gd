extends Panel

func _ready():
	visible = false

func _on_About_pressed():
	visible = true

func _on_Back_pressed():
	visible = false
