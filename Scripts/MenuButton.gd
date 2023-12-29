extends Control


func _on_default_menu_button_button_down():
	var buttontween = get_tree().create_tween()
	buttontween.tween_property($Panel, "scale", Vector2(.45, .45), .03)

func _on_default_menu_button_button_up():
	var buttontween = get_tree().create_tween()
	buttontween.tween_property($Panel, "scale", Vector2(.5, .5), .05)
