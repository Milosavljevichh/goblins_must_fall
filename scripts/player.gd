extends CharacterBody2D

@onready var animator = $animator

const SPEED = 300.0

func _physics_process(delta):
	# Get the input direction as a Vector2
	var direction = Vector2(
		Input.get_axis("walk_left", "walk_right"),
		Input.get_axis("walk_up", "walk_down")
	)
	
	# If there's any input (direction is not zero), normalize the direction vector
	if direction != Vector2.ZERO:
		animator.play("run")
		if direction.x < 0:
			animator.flip_h = true
		else:
			animator.flip_h = false
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		animator.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
