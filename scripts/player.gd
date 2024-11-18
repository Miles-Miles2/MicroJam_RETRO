extends CharacterBody2D


const SPEED = 5000.0

@export var inventory: Array = [null, null]
@export var outline1: ColorRect
@export var outline2: ColorRect
@onready var outlines: Array = [outline1, outline2]

var selectedIndex: int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready() -> void:
	outline1.visible = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * SPEED * delta
	move_and_slide()
	#hover
	var world: PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
	var query: PhysicsPointQueryParameters2D = PhysicsPointQueryParameters2D.new()
	query.collide_with_areas = true
	query.position = get_global_mouse_position()
	var intersectingObjs: Array = world.intersect_point(query)
	if len(intersectingObjs) >= 1:
		var collider = intersectingObjs[0]["collider"]
		if collider.is_in_group("interactable"):
			if collider.has_method("hover"):
				collider.hover()
	#interact
	if Input.is_action_just_pressed("interact"):
		if len(intersectingObjs) >= 1:
			for obj in intersectingObjs:
				if obj["collider"].is_in_group("interactable"):
					obj["collider"].interact(self, inventory[selectedIndex])
					break
	
	if Input.is_action_just_pressed("invSlot1"):
		selectItem(0)
		outline1.visible = true
		outline2.visible = false
	elif Input.is_action_just_pressed("invSlot2"):
		selectItem(1)
		outline1.visible = false
		outline2.visible = true
	elif Input.is_action_just_pressed("drop"):
		dropItem()
		
func selectItem(newIndex: int):
	print("selecting: " + str(newIndex))
	if not selectedIndex == newIndex:
		if not inventory[selectedIndex] == null:
			inventory[selectedIndex].get_parent().visible = false
			inventory[selectedIndex].equipped = false
			inventory[selectedIndex].state = "backpack"
		if not inventory[newIndex] == null:
			inventory[newIndex].get_parent().visible = true
			inventory[newIndex].equipped = true
			inventory[newIndex].state = "equipped"
	selectedIndex = newIndex


func dropItem():

	if inventory[selectedIndex]:
		inventory[selectedIndex].equipped = false
		inventory[selectedIndex].state = "onGround"
		inventory[selectedIndex].get_parent().reparent(get_tree().root.get_child(0))
		inventory[selectedIndex] = null
		outlines[selectedIndex].get_parent().get_node("TextureRect").texture = null
	
func pickUpItem(item: Node2D):
	print(inventory)
	if not inventory[selectedIndex] == null:
		print("dropping")
		dropItem()
	item.get_parent().reparent($Backpack)
	item.equipped = true
	item.state = "equipped"
	item.visible = true
	item.get_parent().position = Vector2(0,0)
	inventory[selectedIndex] = item
	outlines[selectedIndex].get_parent().get_node("TextureRect").texture = item.get_parent().get_node("Sprite2D").texture
