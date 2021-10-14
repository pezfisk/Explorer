extends KinematicBody2D

export var move_speed = 250
var lugar

func _ready():
	visible = true

func _process(delta):
	_look_at_mouse()
	_move_to_mouse()
	if $RayCast2D.is_colliding():
		_teleport()

func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees = rotation_degrees + 90

func _move_to_mouse():
	var direction = get_global_mouse_position() - position
	var normalized_position = direction.normalized()
	move_and_slide(normalized_position * move_speed)

func _teleport():
	lugar = self.position
