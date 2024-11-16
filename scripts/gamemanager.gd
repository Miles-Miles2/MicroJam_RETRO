extends Node

@onready var annoyance_array = get_tree().get_nodes_in_group("annoyance")
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	var yes = 0
	var index = int(randf_range(0,annoyance_array.size()-1))
	while yes == 0:
		if annoyance_array[index].active:
			index = int(randf_range(0,annoyance_array.size()-1))
		else:
			annoyance_array[index].enable()
			yes = 1
