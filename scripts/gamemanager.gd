extends Node

@onready var annoyance_array = get_tree().get_nodes_in_group("annoyance")
@onready var timer: Timer = $Timer

var forbidden_fruit = Array()

func rand_index():
	return randi_range(0,annoyance_array.size()-1)

func _on_timer_timeout() -> void:
	start_event()

func start_event():
	if annoyance_array.size() > 0:
		timer.stop()
		var active_check = 0
		var index = rand_index()
		for i in annoyance_array:
			if i.get_node("Area2D").active == true:
				active_check += 1
		if active_check == annoyance_array.size():
			print("all active")
			timer.start()
			return
		if annoyance_array[index].get_node("Area2D").active:
			timer.start()
		else:
			print(index)
			print(annoyance_array.size())
			print(annoyance_array[index].get_node("Area2D").active)
			annoyance_array[index].get_node("Area2D").beginEvent()
			timer.start()
