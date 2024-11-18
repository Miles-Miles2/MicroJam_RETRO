extends Area2D

@export var active: bool = false
var counter: float = 0
var fcount: int = 0
var hasHovered: bool = false
		
func _process(delta: float) -> void:
	if counter >= 0:
		counter = max(0, counter - (2*delta))
	if active:
		get_parent().get_node("progressBar").size.x = (counter/10) * 12
		if counter >= 10:
			var parent = get_parent()
			active = false
			get_parent().get_node("particles").emitting = false
			parent.get_node("progressBackground").visible = false
			parent.get_node("progressBar").visible = false
			get_parent().get_node("water").playing = false
	fcount += 1
	if fcount > 10:
		fcount = 0
		if (hasHovered == false):
			get_parent().get_node("hover").visible = false
		hasHovered = false

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
	if active == true:
		counter += 0.5
		if item:
			if item.is_in_group("wrench"):
				counter += 0.3
				if get_parent().get_node("rachet").playing == false:
					get_parent().get_node("rachet").playing = true

func beginEvent():
	var parent = get_parent()
	active = true
	counter = 0
	parent.get_node("particles").emitting = true
	parent.get_node("progressBackground").visible = true
	parent.get_node("progressBar").visible = true
	print("toiletClogged")
	get_parent().get_node("water").playing = true
	
func hover():
	get_parent().get_node("hover").visible = true
	hasHovered = true
