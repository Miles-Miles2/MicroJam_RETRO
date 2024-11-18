extends Node2D


@export var window: Node2D


var birdScene = preload("res://scenes/bird.tscn")

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("bird").size() <= 0:
		$Area2D.active = false

func beginEvent():
	if window.get_node("Area2D").open == true:
		$Area2D.active = true 
		for i in range(8):
			var birdClone = birdScene.instantiate()
			add_child(birdClone)
			birdClone.reparent($"entry path")
			birdClone.enterApartment()
			await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		
	
