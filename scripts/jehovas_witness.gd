extends Area2D

@onready var jehova: Node2D = $".."
@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $player
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var talking: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var active = false

func overlappingPlayer():
	return overlaps_body(get_parent().get_parent().get_parent().get_node("player"))

func beginEvent():
	active = true
	animation_player.play("appear")
	
func interact(plyr: Node2D, item: Node2D):
	if overlaps_body(get_parent().get_parent().get_parent().get_node("player")):
		if Input.is_action_just_pressed("interact"):
			print("hi")
			talking.play()
			timer.start()
			get_parent().get_parent().get_parent().get_node("player").set_physics_process(false)

func _on_timer_timeout() -> void:
	active = false
	talking.stop()
	animation_player.play("leave")
	get_parent().get_parent().get_parent().get_node("player").set_physics_process(true)
