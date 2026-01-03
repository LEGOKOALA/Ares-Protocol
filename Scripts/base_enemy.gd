extends CharacterBody2D

@export var speed := 60
@export var max_health := 3
var current_health := max_health

var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	# Stop moving if dead
	if current_health <= 0:
		return

	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
