extends Node

@export var time: float = 0
var timerActive: bool = true


func _physics_process(delta: float) -> void:
	time += delta

func disableTimer():
	timerActive = false
