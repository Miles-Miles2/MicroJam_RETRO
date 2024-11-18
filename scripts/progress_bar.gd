extends ProgressBar

@onready var player: CharacterBody2D = $"../../player"
@onready var timer: Timer = $Timer
@onready var gamemanager: Node = $"../../gamemanager"
@onready var progress_bar: ProgressBar = $"."

@onready var tex1: TextureRect = $"../TextureRect"
@onready var tex2: TextureRect = $"../TextureRect2"
@onready var tex3: TextureRect = $"../TextureRect3"
@onready var tex4: TextureRect = $"../TextureRect4"

func _ready():
	timer.start()
	
func _on_timer_timeout() -> void:

	print(value)
	if gamemanager.num_of_active_events <= 1:
		value -= 2
	else:
		value += gamemanager.num_of_active_events*6
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

	timer.start()
