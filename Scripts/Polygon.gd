extends Marker2D

@export var Sides = 5  
var Radius = 10
var points = []

func _ready():
	set_polygon()

func set_polygon():
	if Sides == 3:
		$Shape.rotation_degrees = 30
	if Sides == 4:
		$Shape.rotation_degrees = 45
	if Sides == 5:
		$Shape.rotation_degrees = -18
	Radius = gizmo_extents
	for i in range(Sides):
		var theta = PI*2 / Sides * i
		var point = Vector2((Radius * cos(theta)),(Radius * sin(theta)))
		points.append(point)
	$Shape.set_polygon(points)
