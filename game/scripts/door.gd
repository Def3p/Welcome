class_name Door
extends StaticBody2D

var is_in_interaction: bool

@export var is_lock: bool = false

@onready var hitbox = $HitboxComponent
@onready var animator = $AnimationPlayer

func _process(_delta):
	if is_in_interaction and Input.is_action_just_pressed("interaction"):
		animator.play("open")


func _on_hitbox_component_area_entered(area):
	if area is Kick:
		var attack = Attack.new()
		attack.damage = 100
		attack.knockback_force = 100
		attack.position = global_position
		
		hitbox.damage(attack)


func _on_interaction_area_entered(_area):
	is_in_interaction = true


func _on_interaction_area_exited(_area):
	is_in_interaction = false
