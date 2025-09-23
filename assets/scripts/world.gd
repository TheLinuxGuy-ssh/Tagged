extends Node2D

@onready var players = [$P1, $P2]
@onready var ladders = $Ladders

func _on_ready():
	Global.audio = $DenAudio

func _process(delta):
	pass
