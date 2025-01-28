extends RayCast2D



signal interact

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		target_position = Vector2(0, -100)
	if Input.is_action_pressed("move_down"):
		target_position = Vector2(0, 100)
	if Input.is_action_pressed("move_left"):
		target_position = Vector2(-100, 0)
	if Input.is_action_pressed("move_right"):
		target_position = Vector2(100, 0)
		
	if is_colliding():
		if Input.is_action_just_pressed("interact"):
			emit_signal("interact")
