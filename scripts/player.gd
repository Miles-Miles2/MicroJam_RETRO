extends CharacterBody2D


const SPEED = 10000.0


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
			intersectingObjs[0]["collider"].interact()
	
