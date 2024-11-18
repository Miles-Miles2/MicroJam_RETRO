extends Button

@export var nextscene: String
@onready var buttonSFX: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer

func _on_pressed() -> void:
	buttonSFX.play()
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(nextscene)
