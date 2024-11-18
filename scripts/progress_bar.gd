extends ProgressBar

@onready var player: CharacterBody2D = $"../../player"
@onready var timer: Timer = $Timer
@onready var gamemanager: Node = $"../../gamemanager"
@onready var progress_bar: ProgressBar = $"."

@onready var tex1: TextureRect = $"../TextureRect"
@onready var tex2: TextureRect = $"../TextureRect2"
@onready var tex3: TextureRect = $"../TextureRect3"
@onready var tex4: TextureRect = $"../TextureRect4"

@export var  total_seconds: int = 0
@export var minutes: int
@export var seconds: int

func get_minutes():
	return minutes

func get_seconds():
	return seconds
	
func end_game():
	timer.stop()
	minutes = int(total_seconds/60)
	seconds = int(total_seconds % 60)
	print("YOU LASTED " + str(minutes) + " MINUTE(S) AND " + str(seconds) + " SECONDS!")
	GlobalTimer.disableTimer()
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")


func _on_timer_timeout() -> void:
	total_seconds += 1
	
	value += gamemanager.num_of_active_events*6
	if value >= 100:
		end_game()
	if 90 < value && value <= 100:
		set_modulate(Color(.21,.053,0))
		tex1.visible = false
		tex2.visible = false
		tex3.visible = false
		tex4.visible = true
	if 66 < value && value <= 90:
		set_modulate(Color(.784,0,.121))
		tex1.visible = false
		tex2.visible = false
		tex3.visible = true
		tex4.visible = false
	if 33 < value && value <= 66:
		set_modulate(Color(.707,.298,0))
		tex1.visible = false
		tex2.visible = true
		tex3.visible = false
		tex4.visible = false
	if value <= 33:
		set_modulate(Color(.761,.769,0))
		tex1.visible = true
		tex2.visible = false
		tex3.visible = false
		tex4.visible = false
