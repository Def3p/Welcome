class_name HealthComponent
extends Node2D

@export var max_health: float = 100

var health: float


func _ready():
	health = max_health


func damage(attack: Attack) -> void:
	health -= attack.damage
	print(health)

	if health <= 0:
		get_parent().queue_free()
