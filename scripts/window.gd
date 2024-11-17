extends Area2D

@export var open: bool = false


func interact(plyr: Node2D, tool: Node2D):
	open = not open
	if open == true:
		get_parent().get_node("AnimatedSprite2D").play("open")
	else:
		get_parent().get_node("AnimatedSprite2D").play("closed")
