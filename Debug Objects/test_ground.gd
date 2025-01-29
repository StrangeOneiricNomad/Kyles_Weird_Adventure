extends StaticBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../TestController")
	player.delete.connect(func _on_delete():
		self.queue_free())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
