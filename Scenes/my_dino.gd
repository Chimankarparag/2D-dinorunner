extends CharacterBody2D

const GRAVITY: int = 4200;
const JUMP_SPEED : int = -1800;


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if (is_on_floor()):
		if get_parent().game_running:
			$RunCollision.disabled = false;
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				$JumpSound.play()
			elif Input.is_action_pressed('ui_down'):
				$RunCollision.disabled = true;
				$AnimatedSprite2D.play("duck")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play('jump')
		
	move_and_slide()
