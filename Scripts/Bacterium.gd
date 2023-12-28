extends RigidBody2D

@export var startingtime = 0
var rng = RandomNumberGenerator.new()
var size = 1
var testsize = 1
var canspawn = true
var scalefactor = 1.2
var maxhp = 100
var hp = 100

func _process(delta):
	testsize = 1
	var setscale = Vector2((scalefactor * size),(scalefactor * size))
	$CollisionShape2D.scale = setscale
	$Area2D/CollisionShape2D.scale = setscale
	$Circle.scale = setscale
	$Circle2.scale = setscale
	for i in $Area2D.get_overlapping_areas():
		if i.is_in_group("Bacterium"):
			testsize += 1
		if i.is_in_group("Wall"):
			self.queue_free()
		if i.is_in_group("Bullet"):
			hp -=1
			i.queue_free()
	if testsize > size and testsize <= 6:
		size = testsize
		hp = maxhp
	startingtime = size * 1.6
	if hp < 0:
		queue_free()

func _ready():
	hp = maxhp
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
