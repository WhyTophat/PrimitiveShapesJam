extends Control

@export var type = 1 # 1 = Start, 2 = Options, 3 = Exit Game

func _on_default_menu_button_button_down():
	var buttontween = get_tree().create_tween()
	buttontween.tween_property($Panel, "scale", Vector2(.45, .45), .03)

func _on_default_menu_button_button_up():
	var buttontween = get_tree().create_tween()
	buttontween.tween_property($Panel, "scale", Vector2(.5, .5), .05)
	if type == 1:
		get_tree().change_scene_to_file("res://Levels/Main.tscn")
	if type == 2:
		pass
	if type == 3:
		get_tree().quit()
