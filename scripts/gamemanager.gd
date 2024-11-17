extends Node

@onready var annoyance_array = get_tree().get_nodes_in_group("annoyance")
@onready var timer: Timer = $Timer

var health = 3
var RAGE: float = 0
var rage_mult: float = 0


func _process(delta: float) -> void:
	var temp = 0
	for i in annoyance_array:
		if i.get_node("Area2D").active:
			temp += 1
	rage_mult = temp
	RAGE += rage_mult * .05
	RAGE = max(0, RAGE - 1 * (delta))
	print(RAGE)
	if RAGE >= 1000:
		health -= 1
		RAGE = 0
		if health <= 0:
			print("YOU LOSE")
	
func is_active(x):
	if x.get_node("Area2D").active:
		return true
	else:
		return false

func rand_index():
	return randi_range(0,annoyance_array.size()-1)

func _on_timer_timeout() -> void:
	start_event()

func start_event():
	timer.stop()
	
	if annoyance_array.size() > 0:
		for i in annoyance_array:
			print (i)

		var index = rand_index()
		if annoyance_array.all(is_active):
			print("all active")
			timer.start()
		if annoyance_array[index].get_node("Area2D").active:
			timer.start()
		else:
			print(index)
			print(annoyance_array.size())
			print(annoyance_array[index].get_node("Area2D").active)
			annoyance_array[index].get_node("Area2D").beginEvent()
			timer.start()
