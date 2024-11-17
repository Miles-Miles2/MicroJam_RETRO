extends PathFollow2D

var active: bool = false
var travelingOnPath: bool = false
var targetPos: Vector2
var running: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active == true:
		if travelingOnPath == true:
			if progress_ratio < 1:
				progress += 100 * delta
			else:
				travelingOnPath = false
				var shape = get_tree().get_nodes_in_group("birdLandable").pick_random()
				var rect = shape.shape.get_rect()
				var x = randf_range(shape.global_position.x - rect.size.x/2, shape.global_position.x + rect.size.x/2)
				var y = randf_range(shape.global_position.y - rect.size.y/2, shape.global_position.y + rect.size.x/2)
				targetPos = Vector2(x, y)
		else:
			var vel = (targetPos - position).normalized() * delta * 100
			position += vel
			if targetPos.distance_to(position) <= 5:
				if running == false:
					active = false
				else:
					queue_free()

func enterApartment():
	active = true
	travelingOnPath = true
	
func shot(shotPos: Vector2):
	if shotPos.distance_to(global_position) < 50 and running == false:
		await get_tree().create_timer(randf_range(0.1, 0.4)).timeout
		active = true
		running = true
		targetPos = Vector2(global_position.x + randf_range(-100, 100), -200)
