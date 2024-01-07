extends Node2D

@onready var map = $map
@onready var pause_menu = $PauseMenu
var is_paused: bool = false
var is_map: bool = false

func _ready():
	Global.game = self
	Global.health_bar = $ProgressBar


func _process(delta):
	map.global_position = $Player.global_position - Vector2(280, 200)
	$ProgressBar.global_position = $Player.global_position - Vector2(280, 140)
	pause_menu.global_position = $Player.global_position
	if Input.is_action_just_pressed("pause") and !is_map:
		pauseMenu()
	if Input.is_action_just_pressed("map") or Input.is_action_just_pressed("pause"):
		if is_map: 
			mapMenu()
			return
	if Input.is_action_just_pressed("map") and !is_paused:
		mapMenu()


func pauseMenu():
	if is_paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	is_paused = !is_paused

func mapMenu():
	if is_map:
		map.hide()
		Engine.time_scale = 1
	else:
		map.show()
		Engine.time_scale = 0
	
	is_map = !is_map
