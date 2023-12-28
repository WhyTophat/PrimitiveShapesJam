extends Node2D

func _process(delta):
	if !($AnimationPlayer.is_playing()):
		queue_free()

func setspawnparams(animationsetter, textsetter, positionsetter):
	$AnimationPlayer.play("float" + str(animationsetter))
	$RichTextLabel.set_text("[center]" + str(textsetter))
	global_position = positionsetter
	print(animationsetter, " ", textsetter," " , positionsetter)

