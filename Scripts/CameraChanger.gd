extends Area2D

@export var CameraName:String
var ActiveCamera = "MainRoom"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().get_parent().get_node("Cameras/" + ActiveCamera).enabled = false
		ActiveCamera = CameraName
		get_parent().get_parent().get_node("Cameras/" + ActiveCamera).enabled = true
