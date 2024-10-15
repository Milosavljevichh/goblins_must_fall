extends Node
class_name FSM

@export var initial_state : State
@onready var current_state

func _ready():
	for child in get_children():
		child.Transition.connect(change_state)
	current_state = initial_state
	current_state.onEnter()

func change_state(next_state):
	current_state.onExit()
	current_state = next_state
	current_state.onEnter()
