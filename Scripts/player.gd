extends CharacterBody2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	
	velocity = Vector2.ZERO
	
	if (Input.is_action_pressed("Up")):
		velocity.y = -1
		
	if (Input.is_action_pressed("Down")):
		velocity.y = 1
		
	if (Input.is_action_pressed("Left")):
		velocity.x = -1
		 
	if (Input.is_action_pressed("Right")):
		velocity.x = 1
		
	velocity = velocity.normalized() * 100
	move_and_slide()
