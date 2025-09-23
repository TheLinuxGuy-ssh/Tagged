extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var player_uid
@onready var animated_sprite = $AnimatedSprite2D
@onready var audio = $Audio
@onready var denicon = $Den
@onready var denaudio = $DenAudio

func _physics_process(delta: float) -> void:
	player_uid = get_parent().get_name()
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed(("jump_" + player_uid)) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audio.play()

	var direction := Input.get_axis("move_left_" + player_uid, "move_right_" + player_uid)
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction:
			animated_sprite.play("Move")
		else:
			animated_sprite.play("Idle")
	else:
		animated_sprite.play("Jump")
		
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_area_entered(area):
		if area.is_in_group("P1"):
			Global.audio.play()
			if Global.den == "P1":
				Global.den = "P2"
				Global.winner = "P1"
			else:
				Global.den = "P1"
				Global.winner = "P2"
				
