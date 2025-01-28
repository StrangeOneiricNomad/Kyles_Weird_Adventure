extends Node



signal open_dialog

var player = null
signal interact

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func _physics_process(delta: float) -> void:
	if player != null:
		if player.name == "Kyle" && Input.is_action_just_pressed("interact"):
			emit_signal("open_dialog")
			print("Sending Signal")



func _on_body_exited(body: Node2D) -> void:
	player = null
	print(player)


func _on_body_entered(body: Node2D) -> void:
	player = body
	if player.name == "Kyle":
		print("In interaction range")
