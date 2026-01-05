extends Area2D

@export var damage := 1
var active: bool = false

func set_active(value: bool) -> void:
	active = value
	monitoring = value
	set_deferred("monitoring", value)

func _ready():
	active = false
	monitoring = false

func _on_body_entered(body: Node2D) -> void:
	if active and body.has_method("take_damage"):
		body.take_damage(damage)
