extends CharacterBody2D

@export var speed := 100
@export var max_health := 5

var current_health := max_health

func _physics_process(delta: float) -> void:
	var input_direction := Vector2.ZERO
	
	input_direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	velocity = input_direction.normalized() * speed
	move_and_slide()


func take_damage(amount: int) -> void:
	current_health -= amount
	print("Player Health: ", current_health)
	
	if current_health <= 0:
		die()

		
func die() -> void:
	print("Player died")
	get_tree().reload_current_scene()
