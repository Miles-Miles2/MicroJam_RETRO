extends Label

@onready var bar: ProgressBar = $CanvasLayer/ProgressBar
@onready var min = get_node("/root/GlobalProgressBar").get_minutes()
@onready var sec = get_node("/root/GlobalProgressBar").get_seconds()
@onready var scream: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	scream.play()
	if min == 1:
		text = ("YOU LASTED\n" + str(min) + " MINUTE\nAND\n" + str(sec) + " SECONDS!")
	else:
		text = ("YOU LASTED\n" + str(min) + " MINUTES\nAND\n" + str(sec) + " SECONDS!")
