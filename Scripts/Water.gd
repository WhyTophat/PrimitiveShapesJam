extends CharacterBody2D

var speed = 15

func _process(delta):
	velocity = Vector2(speed,0).rotated(rotation)
	move_and_collide(velocity)

func setter(positionsetter, anglesetter):
	position = positionsetter
	rotation = anglesetter

func _on_area_2d_area_entered(area):
	#queue_free()
	pass
