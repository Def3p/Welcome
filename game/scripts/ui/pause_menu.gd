extends Control

func _on_resume_pressed():
	Global.game.pauseMenu()


func _on_quit_pressed():
	get_tree().quit()
