extends Node2D

#state can be "onGround", "backpack", or "equipped"
#onGround: Item is on the ground, backpack: item is in player inventory but on equipped, equipped: item is equipped
var state: String = "onGround"
@export var equipped: bool = false
var canShoot: bool = true

var bulletScene = preload("res://scenes/bullet.tscn")

func interact(plyr: Node2D, item: Node2D):
	if state == "onGround":
		state == "equipped"
		plyr.pickUpItem(self)
		

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and equipped and canShoot == true:
		canShoot = false
		for i in range(5):
			var instance = bulletScene.instantiate()
			get_tree().root.get_child(0).add_child(instance)
			instance.global_position = global_position
			instance.rotation = (global_position.angle_to_point(get_global_mouse_position())) + randf_range(-0.07, 0.07)
		get_tree().call_group("bird", "shot", global_position)
		await get_tree().create_timer(1).timeout
		canShoot = true
		
		
