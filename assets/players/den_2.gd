extends TileMapLayer

func _process(delta):
	if Global.den == "P2":
		visible = true
	else:
		visible = false	
