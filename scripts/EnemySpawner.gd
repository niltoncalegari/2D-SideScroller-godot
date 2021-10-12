extends Position2D

enum Direction {RIGHT, LEFT}

export(Direction)var startDirection
export(PackedScene) var enemyScene

var currentEnemyNode = null
var spawnOnNextTick = false

func _ready() -> void:
	$SpawnTimer.connect("timeout", self, "on_spawn_timer_timeout")
	call_deferred("spawn_enemy")
	
func spawn_enemy():
	currentEnemyNode = enemyScene.instance()
	currentEnemyNode.startDirection = Vector2.RIGHT if startDirection == Direction.RIGHT else Vector2.LEFT
	get_parent().add_child(currentEnemyNode)
	currentEnemyNode.global_position = global_position
	
func check_enemy_spawn():
	if (!is_instance_valid(currentEnemyNode)):
		if (spawnOnNextTick):
			spawn_enemy()
			spawnOnNextTick = false
		else:
			spawnOnNextTick = true
		
func on_spawn_timer_timeout():
	check_enemy_spawn()
