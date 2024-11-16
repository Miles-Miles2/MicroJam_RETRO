extends CharacterBody2D


const SPEED = 10000.0

@export var inventory: Array = [null, null]
var selectedIndex: int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input * SPEED * delta
	move_and_slide()
	if Input.is_action_just_pressed("interact"):
		var world: PhysicsDirectSpaceState2D = get_world_2d().direct_space_state
		var query: PhysicsPointQueryParameters2D = PhysicsPointQueryParameters2D.new()
		query.collide_with_areas = true
		query.position = get_global_mouse_position()
		var intersectingObjs: Array = world.intersect_point(query)
		
		if len(intersectingObjs) >= 1:
			intersectingObjs[0]["collider"].interact(self, inventory[selectedIndex])
	
	if Input.is_action_just_pressed("invSlot1"):
		selectItem(0)
	elif Input.is_action_just_pressed("invSlot2"):
		selectItem(1)
	elif Input.is_action_just_pressed("drop"):
		dropItem()
		
func selectItem(newIndex: int):
	print("selecting: " + str(newIndex))
	if not selectedIndex == newIndex:
		if not inventory[selectedIndex] == null:
			inventory[selectedIndex].get_parent().visible = false
			inventory[selectedIndex].equipped = false
		if not inventory[newIndex] == null:
			inventory[newIndex].get_parent().visible = true
			inventory[newIndex].equipped = true
	selectedIndex = newIndex


func dropItem():
	inventory[selectedIndex].equipped = false
	inventory[selectedIndex].get_parent().reparent(get_tree().root.get_child(0))
	inventory[selectedIndex] = null
	
	
func pickUpItem(item: Node2D):
	print(inventory)
	if not inventory[selectedIndex] == null:
		print("dropping")
		dropItem()
	item.get_parent().reparent($Backpack)
	item.equipped = true
	item.visible = true
	item.get_parent().position = Vector2(0,0)
	inventory[selectedIndex] = item
