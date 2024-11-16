extends Camera2D


@export var targetObj: Node2D
@export var lerpMult: float


func _physics_process(delta: float) -> void:
	position = position.lerp(targetObj.position, delta * lerpMult)
