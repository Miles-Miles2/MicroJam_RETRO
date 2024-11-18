extends Label

@onready var bar: ProgressBar = $CanvasLayer/ProgressBar

func _ready() -> void:
	if bar.minutes == 1:
		text = ("YOU LASTED " + str(bar.minutes) + " MINUTE\nAND " + str(bar.seconds) + " SECONDS!")
	else:
		text = ("YOU LASTED " + str(bar.minutes) + " MINUTES\nAND " + str(bar.seconds) + " SECONDS!")
