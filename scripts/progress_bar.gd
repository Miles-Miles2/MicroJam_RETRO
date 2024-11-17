extends ProgressBar

@onready var player: CharacterBody2D = $"../../player"
@onready var timer: Timer = $Timer
@onready var gamemanager: Node = $"../../gamemanager"
@onready var progress_bar: ProgressBar = $"."

func _ready():
	timer.start()
	
func _on_timer_timeout() -> void:

	print(value)
	if gamemanager.num_of_active_events <= 1:
		value -= 2
	else:
		value += gamemanager.num_of_active_events*.05
	if 66 < value && value <= 100:
		set_modulate(Color(.784,0,.121))
	if 33 < value && value <= 66:
		set_modulate(Color(.707,.298,0))
	if value <= 33:
		set_modulate(Color(.761,.769,0))

	timer.start()
