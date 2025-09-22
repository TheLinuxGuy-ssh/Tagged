extends Label

var time = 5



func _process(delta):
	if time>0.0:
		time -= delta
		text = str(int(time))
	else:
		get_tree().change_scene_to_file("res://scenes/results.tscn")
		
		
