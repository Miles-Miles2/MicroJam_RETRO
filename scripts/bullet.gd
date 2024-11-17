extends Sprite2D

var hitTarget: bool = false

func _physics_process(delta: float) -> void:
	if hitTarget == false:
		position += (Vector2(500, 0) * delta).rotated(rotation)
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		if body.is_in_group("killable") and hitTarget == false:
			
			body.get_parent().shot()
		hitTarget = true
		texture = null
		await get_tree().create_timer(0.2).timeout
		queue_free()
