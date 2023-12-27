extends Node2D

@export var spawnscene:PackedScene

func _ready():
	var bacteriumspawn = spawnscene.instantiate()
	bacteriumspawn.setposition(global_position)
	get_parent().add_child(bacteriumspawn)

func setposition(positionsetter):
	global_position = positionsetter
