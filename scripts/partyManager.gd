extends Area2D


@export var active: bool = false
var npcScene = preload("res://scenes/npc.tscn")

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("npc").size() <= 0:
		active = false
		$AudioStreamPlayer2D.playing = false


func beginEvent():
	active = true
	$AudioStreamPlayer2D.playing = true
	for i in range(5):
		var npcClone = npcScene.instantiate()
		add_child(npcClone)
		npcClone.global_position = Vector2(randf_range(-870, -800), randf_range(-10, 20))
