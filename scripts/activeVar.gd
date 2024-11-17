extends Node

@export var active: bool = false

func beginEvent():
	get_parent().beginEvent()
