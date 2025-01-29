extends CanvasLayer





var enemies
var dialogOpen : bool
var dialogBox
var inventory
var textResource
signal startDialogue
signal endDialogue
signal justEndedDialog

signal disableMovement
signal enableMovement




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inventory = $Inventory
	dialogBox = $DialogBox
	dialogBox.hide()
	enemies = get_tree().get_nodes_in_group("Interactables")
	for enemy in enemies:
		enemy.open_dialog.connect(func(text_file):
			if dialogOpen == false:
				dialogOpen = true
				emit_signal("startDialogue", text_file)
				dialogBox.show()
				emit_signal("disableMovement"))
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_interactable_open_dialog(textResource) -> void:
	if dialogOpen == false:
		dialogOpen = true
		emit_signal("startDialogue", textResource)
		dialogBox.show()
		emit_signal("disableMovement")
	else:
		pass
	
	


func _on_dialog_box_end_dialog() -> void:
	emit_signal("justEndedDialog")
	dialogBox.hide()
	emit_signal("enableMovement")
	dialogOpen = false
