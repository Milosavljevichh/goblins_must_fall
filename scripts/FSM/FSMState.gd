extends Node
class_name State

@export var next_state : State

signal Transition(next_state)

func onEnter():
	pass

func _physics_process(delta):
	pass

func _process(delta):
	pass

func onExit():
	pass
