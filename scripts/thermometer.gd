extends Node2D

@export var active: bool = false
var temperature: float = 0
@export var window: Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	temperature = clampf(temperature, 0, 1)
	#too hot at 0.7
	get_parent().get_node("ColorRect").size.y = min(1, temperature) * 13
	
	if get_tree().get_nodes_in_group("window")[0].open == true:
		temperature -= delta * 0.03
	else:
		temperature += delta * 0.05
	
	if temperature >= 0.7:
		get_parent().get_node("ColorRect").color = Color(1,0,0)
		
		active = true
	else:
		get_parent().get_node("ColorRect").color = Color(0,0,1)
		active = false
	
	
func beginEvent():
	pass
