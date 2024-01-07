class_name Door
extends Node2D

var is_in_interaction: bool
var is_open: bool = false

@export var is_lock: bool = false
@export var heavy: int = 1

@onready var hitbox = $Door_body/HitboxComponent
@onready var door = $Door_body

func _process(_delta):
	if !is_lock:
		if is_in_interaction and Input.is_action_just_pressed("interaction"):
			if !is_open: 
				door.rotate(1.5708)
				is_open = true
			else: 
				door.rotate(-1.5708)
				is_open = false


func _on_hitbox_component_area_entered(area):
	var attack = Attack.new()
	attack.damage = 100 * heavy
	attack.knockback_force = 100 * heavy
	attack.position = global_position
	
	hitbox.damage(attack)


func _on_interaction_area_entered(_area):
	is_in_interaction = true


func _on_interaction_area_exited(_area):
	is_in_interaction = false
