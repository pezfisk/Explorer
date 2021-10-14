extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 50
export var max_speed = 200
export var gravity = 20
export var jump_force = -400
var jump_count = 0
var jump = 2
export var max_fall_speed = 750

func _ready():
	$AnimatedSprite.play('Jump')

func _physics_process(_delta):
	motion.y += gravity
	motion.y = min(motion.y, max_fall_speed)
	print(jump_count)
	
	
	if is_on_floor() and next_to_wall() or next_to_wall():
		$AnimatedSprite.play('Idle')
	
	if not is_on_floor():
		$AnimatedSprite.play('Jump')
	
	if Input.is_action_pressed("ui_right"):
		motion.x = max_speed
		if is_on_floor():
			if not next_to_wall():
				$AnimatedSprite.play('Correr')
				$AnimatedSprite.flip_h = true
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -max_speed
		if is_on_floor():
			if not next_to_wall():
				$AnimatedSprite.play('Correr')
				$AnimatedSprite.flip_h = false
	
	if not _pressing_movement():
		motion.x = 0
		if is_on_floor():
			$AnimatedSprite.play('Idle')
	
	if next_to_wall():
		jump_count = 1
	
	if not is_on_floor() and next_to_wall():
		jump = 2
		jump_count = 1
		motion.y = 15
		
		if next_to_left_wall():
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play('WallJumpWall')
			if Input.is_action_just_released("ui_left") or Input.is_action_just_pressed("ui_right") and Input.is_action_pressed("ui_left"):
				$AnimatedSprite.play('WallJumpJump')
				$AnimatedSprite.flip_h = true
				motion.y = jump_force
				motion.x = 400

		if next_to_right_wall():
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play('WallJumpWall')
			if Input.is_action_just_released("ui_right") or Input.is_action_pressed("ui_right") and Input.is_action_just_pressed("ui_left"):
				$AnimatedSprite.play('WallJumpJump')
				$AnimatedSprite.flip_h = false
				motion.x = -400
				motion.y = jump_force
		
	if Input.is_action_just_pressed("ui_cancel"):
		jump_count += 1
	
	if is_on_floor():
		jump = 2
		jump_count = 1
		if Input.is_action_just_pressed("ui_cancel"):
			$AnimatedSprite.play('Jump')
			motion.y  = jump_force
	
	if Input.is_action_just_pressed("ui_cancel") and jump_count <= jump:
		motion.y = jump_force
	
	if Input.is_action_pressed("ui_cancel") and Input.is_action_pressed("ui_page_down"):
# warning-ignore:return_value_discarded
		get_tree().change_scene('res://Scenes/Maps/MainMenuDebug.tscn')
	
	if Input.is_action_pressed("ui_end") and Input.is_action_pressed("ui_page_down"):
		jump = 9093205738190537089
	
	if Input.is_action_just_pressed("esc"):
# warning-ignore:return_value_discarded
		get_tree().change_scene('res://Scenes/Maps/MainMenu.tscn')
	
	if Input.is_action_just_pressed("restart"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	
	motion = move_and_slide(motion, UP)

func next_to_right_wall():
	return $RayCastRight.is_colliding()
	
func next_to_left_wall():
	return $RayCastLeft.is_colliding()

func next_to_wall():
	return $RayCastRight.is_colliding() or $RayCastLeft.is_colliding()

func _pressing_movement():
	return Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")

# warning-ignore:unused_argument
func _on_Orb_body_entered(body):
	print(jump)
	jump += 1
