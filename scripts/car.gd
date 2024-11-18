extends Area2D

@onready var animation: AnimationPlayer = $"../AnimationPlayer"
@onready var alarm: AudioStreamPlayer2D = $"../alarmSFX"
@onready var bang: AudioStreamPlayer2D = $"../bangSFX"
@onready var car_sprite: AnimatedSprite2D = $".."
@onready var timer: Timer = $"../Timer"
@onready var collider_i_hardly_know_her: CollisionShape2D = $CollisionShape2D
@onready var area_2d: Area2D = $"."

@export var active: bool = false

var health = 10

func overlappingPlayer():
	return overlaps_body(get_parent().get_parent().get_parent().get_node("player"))
	
func disable():
	animation.play("leave")

func beginEvent():
	car_sprite.visible = true
	collider_i_hardly_know_her.disabled = false
	animation.play("enter")
	health = 10
	active = true
	print("vroom vroom")
	alarm.play()
	
func interact(plyr: Node2D, item: Node2D):
	if overlaps_body(get_parent().get_parent().get_parent().get_node("player")):
		print("YIPEE")
		if Input.is_action_just_pressed("interact"):
			bang.play()
			health -= 1
		if health <= 0:
			animation.play("leave")
