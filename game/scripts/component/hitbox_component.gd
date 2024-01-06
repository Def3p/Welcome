class_name Kick
extends Area2D

@export var health_component: HealthComponent


func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)
