extends CharacterBody2D

@onready var animator = $animator
@onready var hurt_box = $hurt_box

const SPEED = 300.0

var is_attacking = false

func _physics_process(delta):
	if !is_attacking:
	# Get the input direction as a Vector2
		var direction = Vector2(
			Input.get_axis("walk_left", "walk_right"),
			Input.get_axis("walk_up", "walk_down")
		)
		
		# If there's any input (direction is not zero), normalize the direction vector
		if direction != Vector2.ZERO:
			animator.play("run")
			if direction.x < 0:
				hurt_box.scale.x = -1
				animator.flip_h = true
			else:
				hurt_box.scale.x = 1
				animator.flip_h = false
			direction = direction.normalized()
			velocity = direction * SPEED
		else:
			animator.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
		move_and_slide()

func _input(event):
	if event.is_action_pressed("interact"):
		is_attacking = true
		animator.play("attack1")


func _on_animator_animation_finished():
	if animator && animator.animation == "attack1":
		hurt_box.monitoring = false
		is_attacking = false


func _on_animator_frame_changed():
	if animator && animator.animation == "attack1" && animator.frame == 2:
		hurt_box.monitoring = true


func _on_hurt_box_body_entered(body):
	body.take_damage()
