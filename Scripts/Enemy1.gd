extends KinematicBody2D

var shard = self.position

const UP = Vector2(0, -1)
var motion = Vector2()
export var speed = 100
export var gravity = 20
export var jump_force = -400
var see

func _ready():
	motion.x = speed

func _physics_process(_delta):
	motion.y += gravity
	
	if No_floor_left() == false:
		$AnimatedSprite.flip_h = false
		motion.x = speed * 2
		motion.x = speed
	
	if No_floor_right() == false:
		$AnimatedSprite.flip_h = true
		motion.x = -speed * 2
		motion.x = -speed
	
	if WallRight():
		$AnimatedSprite.flip_h = true
		motion.x = -speed
	
	if WallLeft():
		$AnimatedSprite.flip_h = false
		motion.x = speed
	
	motion = move_and_slide(motion, UP)
	
func WallRight():
	return $LowRight2.is_colliding()

func WallLeft():
	return $LowLeft2.is_colliding()

func No_floor_left():
	return $LowLeft.is_colliding()

func No_floor_right():
	return $LowRight.is_colliding()
