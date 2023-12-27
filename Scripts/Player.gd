@tool
extends CharacterBody2D

var canshoot = true

@export_category("Circle")
@export var Refresh = false

@export_category("Player Stats")
@export var Topspeed = 300
@export var Accel = 50
@export var Firerate = .2

@export_category("Scenes")
@export var Bullet:PackedScene


func _physics_process(_delta):
	if Engine.is_editor_hint():
		if Refresh == true:
			Refresh = false
			queue_redraw()
	if !(Engine.is_editor_hint()):
		_movement()
		$Shooter.look_at(get_global_mouse_position())
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canshoot == true:
			canshoot = false
			$FireTimer.start(Firerate)
			shoot()

func shoot():
	var BulletScene = Bullet.instantiate()
	BulletScene.position_set(global_position)
	get_parent().add_child(BulletScene)

func _movement():
	var dirx = Input.get_axis("ui_left", "ui_right")
	var diry = Input.get_axis("ui_up", "ui_down")
	if dirx:
		if velocity.x < (Topspeed * dirx):
			velocity.x += Accel
		if velocity.x > (Topspeed * dirx):
			velocity.x -= Accel
	else:
		if velocity.x > 0:
			velocity.x -= Accel
		if velocity.x < 0:
			velocity.x += Accel
	if diry:
		if velocity.y < (Topspeed * diry):
			velocity.y += Accel
		if velocity.y > (Topspeed * diry):
			velocity.y -= Accel
	else:
		if velocity.y > 0:
			velocity.y -= Accel
		if velocity.y < 0:
			velocity.y += Accel
	move_and_slide()

func _draw():
	draw_circle(Vector2.ZERO, $Circle.gizmo_extents, Color.RED)

func _on_fire_timer_timeout():
	canshoot = true
