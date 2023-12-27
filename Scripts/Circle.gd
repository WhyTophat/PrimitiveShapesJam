@tool
extends Marker2D

@export var Refresh = false
@export var BodyColor:String

func _process(delta):
	if Engine.is_editor_hint():
		if Refresh == true:
			Refresh = false
			queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, gizmo_extents, Color.html(BodyColor))
