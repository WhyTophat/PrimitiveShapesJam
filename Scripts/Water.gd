extends CharacterBody2D

var speed = 10

func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(rotation)
	move_and_collide(velocity)

func setter(positionsetter, anglesetter):
	position = positionsetter
	rotation = anglesetter

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bacterium") or area.is_in_group("Wall"):
		await get_tree().process_frame
		queue_free()

func _on_timer_timeout():
	queue_free()
