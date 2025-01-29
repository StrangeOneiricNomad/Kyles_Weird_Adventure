extends Node

var content = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_file()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(content)

func load_file():
	var file = FileAccess.open("res://resources/fileTesting.txt", FileAccess.READ)
	content = file.get_as_text()
