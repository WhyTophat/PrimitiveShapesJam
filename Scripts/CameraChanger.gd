extends Area2D

@export var CameraName:String
@export var Enabler:String
var ActiveCamera = "MainRoom"
signal enable 

func _ready():
	get_parent().get_node(Enabler).connect("enable", _on_enable)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("enable")
		get_parent().get_parent().get_node("Cameras/" + ActiveCamera).enabled = false
		ActiveCamera = CameraName
		get_parent().get_parent().get_node("Cameras/" + CameraName).enabled = true
		set_deferred("monitoring", false)

func _on_enable():
	set_deferred("monitoring", true)
