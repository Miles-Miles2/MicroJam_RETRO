extends Area2D

var active: bool = false
var counter: float = 0

func _ready():
	beginEvent()
	
		
func _process(delta: float) -> void:
	if counter >= 0:
		counter = max(0, counter - (2*delta))
	if active:
		printProgress()
		if counter >= 10:
			active = false

func printProgress():
	var tmp: String = "Progress: ["
	for i in range(10):
		if (floor(counter) >= i):
			tmp += "#"
		else:
			tmp += "-"
	tmp += "]"
	print(tmp)

func interact():
	print("toilet interacted")
	if active == true:
		counter += 0.5

func beginEvent():
	active = true
	counter = 0
	print("toiletClogged")
