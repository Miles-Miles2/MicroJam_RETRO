extends Area2D

@export var active: bool = false

func _ready() -> void:
	beginEvent()

func beginEvent():
	active = true
	get_parent().get_node("AnimatedSprite2D").visible = true
	get_parent().get_node("textParticles").emitting = true

func interact(plyr: Node2D, tool: Node2D):
	print("interacted")
	if plyr.global_position.distance_to(global_position) <= 20:
		print("player close")
		if active == true:
			if tool.is_in_group("remote"):
				active = false
				get_parent().get_node("AnimatedSprite2D").visible = false
				get_parent().get_node("textParticles").emitting = false
