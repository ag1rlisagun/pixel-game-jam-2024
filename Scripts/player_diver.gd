extends CharacterBody2D


const SPEED = 300.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	var direction_x = Input.get_axis("swim_left", "swim_right")
	var direction_y = Input.get_axis("swim_up", "swim_down")
	
	if direction_x > 0:
			animated_sprite.flip_h = false
			animated_sprite.rotation_degrees = -10.3
	elif direction_x < 0:
		animated_sprite.flip_h = true
		animated_sprite.rotation_degrees = 10.3

	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
