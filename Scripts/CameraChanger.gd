extends Area2D

@export var CameraName:String
@export_category("ActiveCamera")
@export var Weapons = false
@export var MainRoom = false
@export var Pathogens = false
var ActiveCamera:String

func _ready():
	if Weapons:
		ActiveCamera = "Weapons"
	if MainRoom:
		ActiveCamera = "MainRoom"
	if Pathogens:
		ActiveCamera = "Pathogens"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().get_parent().get_node("Cameras/Camera").position = get_parent().get_parent().get_node("Cameras/" + ActiveCamera).position
