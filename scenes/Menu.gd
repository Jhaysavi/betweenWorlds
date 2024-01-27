extends Control



func _on_quit_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().quit()
	pass # Replace with function body.
