extends CharacterBody2D

const speed = 200
const acc = 7

@export var building : StaticBody2D
@onready var nav_agent = $NavigationAgent2D
@onready var animator = $animator

var current_state = "wander"

func _physics_process(delta):
	if current_state == "wander":
		var direction = Vector3()
		nav_agent.target_position = Vector2(building.global_position.x, building.global_position.y + 60)
		direction = (nav_agent.get_next_path_position() - global_position).normalized()
		animator.play("run")
		velocity = velocity.lerp(direction * speed, delta)
		move_and_slide()
