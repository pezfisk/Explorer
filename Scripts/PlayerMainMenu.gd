extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 200
export var gravity = 20
export var jump_force = -400
var jump_count = 0
var jump = 2

func _ready():
	$AnimatedSprite.play('Jump')

func _physics_process(_delta):
	motion.y += gravity
	
	if not is_on_floor():
		$AnimatedSprite.play('Jump')
	
	if motion.x == 0:
		if is_on_floor():
			$AnimatedSprite.play('Idle')
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		if is_on_floor():
			$AnimatedSprite.play('Correr')
			$AnimatedSprite.flip_h = true
	else: 
		motion.x = 0
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		if is_on_floor():
			$AnimatedSprite.play('Correr')
			$AnimatedSprite.flip_h = false
	
	if next_to_wall():
		jump_count = 1
	
	if not is_on_floor() and next_to_wall():
		jump = 2
		motion.y = 10  #lerp(motion.y,,0.1)
		jump_count = 1
		
		if next_to_left_wall():
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play('WallJumpWall')
			if Input.is_action_just_released("ui_left"):
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
	
	motion = move_and_slide(motion, UP)

func next_to_right_wall():
	return $RayCastRight.is_colliding()
	
func next_to_left_wall():
	return $RayCastLeft.is_colliding()

func next_to_wall():
	return $RayCastRight.is_colliding() or $RayCastLeft.is_colliding()

# warning-ignore:unused_argument
func _on_Orb_body_entered(body):
	jump += 1
