extends KinematicBody2D

var player
var dialogText = "Saia da minha frente, estou aguardando meu date."
var dialogVisible = false

func _ready():
	set_process(true)
	player = get_node("/root/Player")  
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body):
	if body.is_in_group("player"):
		show_dialog()

func _on_body_exited(body):
	if body.is_in_group("player"):
		hide_dialog()

func show_dialog():
	if not dialogVisible:
		dialogVisible = true

		print(dialogText)

func hide_dialog():
	if dialogVisible:
		dialogVisible = false

