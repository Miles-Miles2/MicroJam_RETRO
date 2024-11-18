extends Label

@onready var car: AnimatedSprite2D = $"../../Annoyances/car"
@onready var jehova: Node2D = $"../../Annoyances/Jehova"



func _process(delta: float) -> void:
	if car.get_node("Area2D").overlappingPlayer():
		text = ("SPAM E WHILE HOVERING\nOVER CAR WITH MOUSE")	
	elif jehova.get_node("Area2D").overlappingPlayer():
		text = ("PRESS E WHILE HOVERING\nOVER MAN WITH MOUSE")
	else:
		text = ("")
	
