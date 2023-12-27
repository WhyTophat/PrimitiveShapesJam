extends RigidBody2D

@export var startingtime = 0
var rng = RandomNumberGenerator.new()
var size = 1
var testsize = 1
var canspawn = true
var scalefactor = 1.02

func _process(delta):
	testsize = 1
	$CollisionShape2D.scale = Vector2((scalefactor * size),(scalefactor * size))
	$Area2D/CollisionShape2D.scale = Vector2((scalefactor * size),(scalefactor * size))
	$Circle.scale = Vector2((scalefactor * size),(scalefactor * size))
	$Circle2.scale = Vector2((scalefactor * size),(scalefactor * size))
	for i in $Area2D.get_overlapping_areas():
		if i.is_in_group("Bacterium"):
			testsize += 1
		if i.is_in_group("Wall"):
			self.queue_free()
	if testsize > size and testsize <= 6:
		size = testsize
	startingtime = size ** 2

func _ready():
	startingtime = $SpawnTimer.wait_time

func spawn():
	var spawntimerrng = rng.randf_range(-1, 1)
	if canspawn == true:
		var bacteriumspawn = load("res://Reuse/Bacterium.tscn").instantiate()
		var spawnposition = rng.randi_range(0, 360)
		$SpawnPoint.rotation_degrees = spawnposition
		bacteriumspawn.setposition($SpawnPoint/EmissionPoint.global_position)
		get_parent().add_child(bacteriumspawn)
	$SpawnTimer.wait_time = ($SpawnTimer.wait_time + spawntimerrng)
	$SpawnTimer.start()

func setposition(positionsetter):
	global_position = positionsetter

func _on_spawn_timer_timeout():
	$SpawnTimer.wait_time = startingtime
	spawn()

func _on_age_timeout():
	queue_free()
