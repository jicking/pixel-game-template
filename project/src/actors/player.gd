extends KinematicBody2D

export var gravity := 320 * 2  # px / s ^2
export var speed_max := 128# px / s

export var acceleration := 8 #half tile size

var can_move := true
var velocity = Vector2.ZERO
var direction_x := 0

func _process(delta):
	direction_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

func _physics_process(delta):
	if not can_move :
		return
		
	if direction_x != 0:
		velocity.x += direction_x * acceleration * delta * 60
		velocity.x = clamp(velocity.x, -speed_max, speed_max)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

