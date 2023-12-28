extends Node2D


func setspawnparams(animationsetter, textsetter, positionsetter):
	$AnimationPlayer.play("float" + str(animationsetter))
	$RichTextLabel.set_text("[center]" + str(textsetter))
	global_position = positionsetter
	print(animationsetter, " ", textsetter," " , positionsetter)

func _on_timer_timeout():
	queue_free()
