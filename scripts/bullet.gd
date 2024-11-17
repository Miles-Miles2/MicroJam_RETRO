extends Sprite2D

func _physics_process(delta: float) -> void:
	position += (Vector2(500, 0) * delta).rotated(rotation)
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		if body.is_in_group("killable"):
			body.get_parent().shot()
		queue_free()
