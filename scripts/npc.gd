extends Node2D

var dead: bool = false
var alpha: float = 1



func _ready() -> void:
	var frames = $Sprite2D.texture.get_width() / $Sprite2D.region_rect.size.x
	var randIndex = randi_range(0, frames-1)
	$Sprite2D.region_rect.position.x = randIndex * $Sprite2D.region_rect.size.x
	await get_tree().create_timer(randf_range(0, 3)).timeout
	$AnimationPlayer.play("idle")
	

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
	$die.playing = true
	$AnimationPlayer.play("die")
	
	
