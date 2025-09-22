extends Label

var time = 120



func _process(delta):
	if time>0.0:
		time -= delta
		text = str(int(time))
	else:
		get_tree().paused = true
		
		
