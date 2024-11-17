extends Node2D

var dead: bool = false
var alpha: float = 1

func _process(delta: float) -> void:
	if dead == true:
		alpha -= delta * 1.5
		$Sprite2D.modulate = Color(1, 0, 0, alpha)
		if alpha <= 0:
			queue_free()


func shot():
	$CPUParticles2D.emitting = true
	$Sprite2D.modulate = Color(1,0,0, 1)
	print("shot")
	dead = true
	$AnimationPlayer.play("die")
	
	
