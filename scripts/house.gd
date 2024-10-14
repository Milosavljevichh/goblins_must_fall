extends StaticBody2D

@onready var full_hp = $full_hp
@onready var destroyed = $destroyed
@onready var full_col = $full_col
@onready var destroyed_col = $destroyed_col

@export var max_hp : int
var hp
var current_state = "alive"

func _ready():
	hp = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp <= 0 && current_state == "alive":
		transition_state("dead")

func transition_state(state):
	current_state = state
	full_hp.visible = !full_hp.visible 
	full_col.disabled = !full_col.disabled
	destroyed.visible = !destroyed.visible
	destroyed_col.disabled = !destroyed_col.disabled

func take_damage():
	hp -= 1
