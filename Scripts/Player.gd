extends CharacterBody2D

var canshoot = true

@export_category("Circle")
@export var Refresh = false

@export_category("Player Stats")
@export var Topspeed = 450
@export var Accel = 50
@export var Firerate = .15

@export_category("Scenes")
@export var Bullet:PackedScene


func _physics_process(_delta):
	_movement()
	$Shooter.look_at(get_global_mouse_position())
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canshoot == true:
		canshoot = false
		$FireTimer.start(Firerate)
		shoot()

func shoot():
	var BulletScene = Bullet.instantiate()
	BulletScene.setter($Shooter/EmissionPoint.global_position, $Shooter.rotation)
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
		if velocity.x > 100:
			velocity.x -= Accel
		elif velocity.x < -100:
			velocity.x += Accel
		else:
			velocity.x = 0
	if diry:
		if velocity.y < (Topspeed * diry):
			velocity.y += Accel
		if velocity.y > (Topspeed * diry):
			velocity.y -= Accel
	else:
		if velocity.y > 100:
			velocity.y -= Accel
		elif velocity.y < -100:
			velocity.y += Accel
		else:
			velocity.y = 0
	move_and_slide()

func _on_fire_timer_timeout():
	canshoot = true
