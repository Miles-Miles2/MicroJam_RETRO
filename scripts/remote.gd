extends Node2D

#state can be "onGround", "backpack", or "equipped"
#onGround: Item is on the ground, backpack: item is in player inventory but on equipped, equipped: item is equipped
@export var state: String = "onGround"
@export var equipped: bool = false

func interact(plyr: Node2D, item: Node2D):
	if state == "onGround":
		state == "equipped"
		plyr.pickUpItem(self)
	
