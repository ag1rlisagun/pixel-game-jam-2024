extends CharacterBody2D


const SPEED = 100.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var action_prompt = $ActionPrompt

func player():
	pass

func _physics_process(delta):
	
	var direction_x = Input.get_axis("swim_left", "swim_right")
	var direction_y = Input.get_axis("swim_up", "swim_down")
	
	if direction_x > 0:
			animated_sprite.flip_h = false
			animated_sprite.rotation_degrees = -10.3
	elif direction_x < 0:
		animated_sprite.flip_h = true
		animated_sprite.rotation_degrees = 10.3

	if direction_x and direction_y:
		velocity.x = direction_x * (SPEED/2)
		velocity.y = direction_y * (SPEED/2)
#		print("vel x: " + str(velocity.x))
#		print("vel y: " + str(velocity.y))
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/2)
		velocity.y = move_toward(velocity.y, 0, SPEED/2)

	if direction_x:
		velocity.x = direction_x * SPEED
#		print("vel x: " + str(velocity.x))
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
#		print("vel y: " + str(velocity.y))
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.get_normal())

	# using move_and_slide
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.has_method("collectible"):
		action_prompt.visible = true

func _on_area_2d_area_exited(area):
	if area.has_method("collectible"):
		action_prompt.visible = false
