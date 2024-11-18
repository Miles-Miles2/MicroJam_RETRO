extends Area2D

@onready var jehova: Node2D = $".."
@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $player
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var talking: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var active = false

func beginEvent():
	active = true
	animation_player.play("appear")
	
func interact(plyr: Node2D, item: Node2D):
	if plyr.global_position.distance_to(global_position) < 20:
		print("hi")
		talking.play()
		timer.start()
		plyr.set_physics_process(false)
	else:
		$tooFar.visible = true
		await get_tree().create_timer(1).timeout
		$tooFar.visible = false
		

func _on_timer_timeout() -> void:
	active = false
	talking.stop()
	animation_player.play("leave")
	get_parent().get_parent().get_parent().get_node("player").set_physics_process(true)
