extends CharacterBody2D

@export var speed := 100

func _physics_process(delta: float) -> void:
	var input_direction := Vector2.ZERO
	
	input_direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	velocity = input_direction.normalized() * speed
	move_and_slide()
