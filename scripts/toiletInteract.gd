extends Area2D

var active: bool = false
var counter: float = 0

	
		
func _process(delta: float) -> void:
	if counter >= 0:
		counter = max(0, counter - (2*delta))
	if active:
		printProgress()
		if counter >= 10:
			active = false
			get_parent().get_node("particles").emitting = false

func printProgress():
	var tmp: String = "Progress: ["
	for i in range(10):
		if (floor(counter) >= i):
			tmp += "#"
		else:
			tmp += "-"
	tmp += "]"
	print(tmp)

func interact(plyr: Node2D, item: Node2D):
	print("toilet interacted")
	if active == true and item.is_in_group("wrench"):
		counter += 0.5

func beginEvent():
	active = true
	counter = 0
	get_parent().get_node("particles").emitting = true
	print("toiletClogged")
