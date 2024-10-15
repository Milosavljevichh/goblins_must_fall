extends State

func onEnter():
	print('entered wander state')

func _physics_process(delta):
	pass

func _process(delta):
	pass

func onExit():
	print('exited wander state')


func _on_pause_timeout():
	Transition.emit(next_state)
