extends Button

var node = VBoxContainer

func _ready():
	pass 

func _on_Button_pressed():
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
