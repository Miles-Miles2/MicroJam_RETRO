extends Node2D

func _ready() -> void:
	beginEvent()


var birdScene = preload("res://scenes/bird.tscn")

func beginEvent():
	for i in range(8):
		var birdClone = birdScene.instantiate()
		add_child(birdClone)
		birdClone.reparent($"entry path")
		birdClone.enterApartment()
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
