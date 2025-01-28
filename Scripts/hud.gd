extends CanvasLayer


var dialogBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogBox = $DialogBox
	dialogBox.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_interactable_open_dialog() -> void:
	dialogBox.show()
