class_name Player
extends CharacterBody2D

var smoothed_position: Vector2
var smoothed_position_legs: Vector2
var state: String = "default"
@export var speed: int = 120

@onready var animator = $AnimationPlayer
@onready var legs = $Legs
@onready var body_parts = $BodyParts
@onready var collision = $CollisionShape2D1

func _physics_process(delta):
	if Engine.time_scale == 0:
		return
	
	Global.health_bar.value = $HealthComponent.health
	
	if Input.is_action_just_pressed("kick"):
		state = "kick"
		velocity = Vector2.ZERO
		
	smoothed_position = lerp(smoothed_position, get_global_mouse_position(), 0.2)
	look_at(smoothed_position)
		
	if state == "default":
		smoothed_position_legs = lerp(smoothed_position_legs, get_global_mouse_position(), 0.25)
		legs.look_at(smoothed_position_legs)
		
		var direction_x = Input.get_axis("left", "right")
		if direction_x:
			velocity.x = direction_x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			
		var direction_y = Input.get_axis("up", "down")
		if direction_y:
			velocity.y = direction_y * speed
		else:
			velocity.y = move_toward(velocity.y, 0, speed)
		
		if !direction_x and !direction_y:
			animator.play("stop")
		else: 
			animator.play("walk")
	elif state == "kick":
		animator.play("kick")

	move_and_slide()

func _on_player_animation_finished(anim_name):
	if anim_name == "walk":
		animator.play("walk")
	elif anim_name == "kick":
		state = "default"
