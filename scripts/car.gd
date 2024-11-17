extends Area2D

@onready var animation: AnimationPlayer = $"../AnimationPlayer"
@onready var alarm: AudioStreamPlayer2D = $"../alarmSFX"
@onready var bang: AudioStreamPlayer2D = $"../bangSFX"
@onready var timer: Timer = $"../Timer"
var active: bool = false
var health = 10
var t = 0
	
	
func beginEvent():
	animation.play("move")
	health = 10
	active = true
	print("vroom vroom")
	alarm.play()
	
func interact(plyr: Node2D, item: Node2D):
	bang.play()
	health -= 1
	if health <= 0:
		active = false
