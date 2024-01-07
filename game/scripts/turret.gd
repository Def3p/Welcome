class_name Turret
extends CharacterBody2D

var is_in_visible_zone: bool = false
var target_area: HitboxComponent
var last_visible_position: Vector2
var is_angry: bool = false
var smoothed_position: Vector2
var is_ready_to_shoot: bool = true

@export var side: int = 1
@onready var angry_timer = $Angry
@onready var turret = $"."
@onready var tower = $Tower
@onready var visible_raycast = $RayCast2D
@onready var target_raycast = $Tower/RayCast2D

func _ready():
	if side == 1:
		tower.rotation = 0
	elif side == 2:
		tower.rotation = 1.5708
	elif side == 3:
		tower.rotation = 1.5708 * 2
	elif side == 4:
		tower.rotation = 1.5708 * 3

func _physics_process(delta):
	if target_area != null:
		visible_raycast.target_position = target_area.global_position
	
	if is_angry:
		smoothed_position = lerp(smoothed_position, last_visible_position, 0.2)
		look_at(smoothed_position)
	
	if visible_raycast.is_colliding() and visible_raycast.get_collider() is Player:
		angry_timer.stop()
		is_angry = true
		last_visible_position = target_area.global_position
	else: angry_timer.start()


func shoot():
	pass


func _on_visible_area_entered(area):
	target_area = area


func _on_visible_area_exited(_area):
	target_area = null


func _on_angry_timeout():
	is_angry = false
