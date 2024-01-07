class_name Warden
extends CharacterBody2D

var speed = 100
var accel = 7

@onready var nav: NavigationAgent2D = $NavigationAgent2D
@onready var animator = $AnimationPlayer

func _physics_process(delta):
	look_at(global_position + velocity)
	animator.play("walk")
	var direction = Vector3()
	
	nav.target_position = get_global_mouse_position()
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, accel * delta)
	
	move_and_slide()
