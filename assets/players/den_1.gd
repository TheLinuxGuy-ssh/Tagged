extends TileMapLayer

func _process(delta):
	if Global.den == "P1":
		visible = true
	else:
		visible = false	
