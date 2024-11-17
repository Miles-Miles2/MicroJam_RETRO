extends Area2D

@export var active: bool = false

var fcount: int = 0
var hasHovered: bool = false

func _process(delta: float) -> void:
	fcount += 1
	if fcount > 10:
		fcount = 0
		if (hasHovered == false):
			get_parent().get_node("hover").visible = false
			
		hasHovered = false

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
	else:
		if get_parent().get_node("tooFar").visible == false:
			get_parent().get_node("tooFar").visible = true
			await get_tree().create_timer(2).timeout
			get_parent().get_node("tooFar").visible = false

func hover():
	get_parent().get_node("hover").visible = true
	hasHovered = true
