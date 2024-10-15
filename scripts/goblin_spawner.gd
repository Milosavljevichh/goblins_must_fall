extends Marker2D

@onready var torch_goblin = preload("res://scenes/enemies/goblin_basic.tscn")
@onready var cooldown = $cooldown

@onready var level_node = get_tree().get_root().get_node("Base")

var enemies_spawned = 0
#When upgrading this,make a class which will hold all spawners and on timeout
#get a random spawner and make it spawn the enemy
func _on_cooldown_timeout():
	spawn_goblin()

func spawn_goblin():
	if enemies_spawned < 6:
		var goblin = torch_goblin.instantiate()
		goblin.position = position
		goblin.building = level_node.get_node("House")
		level_node.get_node("Enemies").add_child(goblin)
		enemies_spawned += 1
