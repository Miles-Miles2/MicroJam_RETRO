extends Label

@onready var car: AnimatedSprite2D = $"../../Annoyances/car"
@onready var jehova: Node2D = $"../../Annoyances/Jehova"

func _process(delta: float) -> void:
	if car.get_node("Area2D").overlappingPlayer():
		text = ("Spam \"E\" send car away")
	elif jehova.get_node("Area2D").overlappingPlayer():
		text = ("\"E\" to send solicitor away")
	else:
		text = ("")
