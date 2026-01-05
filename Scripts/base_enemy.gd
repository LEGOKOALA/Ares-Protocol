extends CharacterBody2D

@export var speed := 60
@export var max_health := 3
var current_health := max_health
var player: Node2D

func _ready():
	player = get_tree().get_first_node_in_group("player")
	$Killzone.set_active(false)

func _physics_process(delta):
	if current_health <= 0 or not player:
		return

	var dir = player.global_position - global_position
	var distance = dir.length()
	var direction = dir.normalized()

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			$Killzone.position = Vector2(16, 0)
		else:
			$Killzone.position = Vector2(-16, 0)
	else:
		if direction.y > 0:
			$Killzone.position = Vector2(0, 16)
		else:
			$Killzone.position = Vector2(0, -16)

	var killzone_shape = $Killzone.get_node("CollisionShape2D").shape
	var killzone_front_distance := 0
	if killzone_shape is RectangleShape2D:
		killzone_front_distance = killzone_shape.extents.x
	elif killzone_shape is CapsuleShape2D:
		killzone_front_distance = killzone_shape.height / 2
	elif killzone_shape is CircleShape2D:
		killzone_front_distance = killzone_shape.radius

	var body_shape = $CollisionShape2D.shape
	var body_half_size := 0
	if body_shape is RectangleShape2D:
		body_half_size = body_shape.extents.x
	elif body_shape is CapsuleShape2D:
		body_half_size = body_shape.height / 2
	elif body_shape is CircleShape2D:
		body_half_size = body_shape.radius

	var total_stop_distance = killzone_front_distance + body_half_size + 5

	if distance > total_stop_distance:
		velocity = direction * speed
		$Killzone.set_active(false)
	else:
		velocity = Vector2.ZERO
		$Killzone.set_active(true)

	move_and_slide()

func take_damage(amount: int) -> void:
	current_health -= amount
	print("Enemy Health:", current_health)
	if current_health <= 0:
		die()

func die() -> void:
	queue_free()
