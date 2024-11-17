extends Node

@onready var annoyance_array = get_tree().get_nodes_in_group("annoyance")
@onready var timer: Timer = $Timer

func rand_index():
	return int(randf_range(0,annoyance_array.size()-1))

func _on_timer_timeout() -> void:
	start_event()

func start_event():
	var index = rand_index()
	if annoyance_array[index].get_node("Area2D").active:
		start_event()
	else:
		print(index) 
		print(annoyance_array.size())
		annoyance_array[index].get_node("Area2D").beginEvent()
		timer.start()
	
