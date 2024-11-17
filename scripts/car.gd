extends Area2D

@onready var alarm: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
var active: bool = false

func beginEvent():
	active = true
	print("vroom vroom")
	alarm.play()
	
func interact(plyr: Node2D, item: Node2D):
	print("touch")
