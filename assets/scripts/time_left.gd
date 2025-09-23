extends Label

var time = Global.time

func _process(delta):
	pass

func _on_timer_timeout():
	if time > 0:
		time -= 1
		text = str(int(time))
	else: 
		get_tree().change_scene_to_file("res://scenes/results.tscn")
