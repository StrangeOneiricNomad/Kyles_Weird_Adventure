extends Node

@export var text_file : Resource
var player = null
var dialogOpen : bool

signal interact
signal open_dialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogOpen = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func _physics_process(delta: float) -> void:
	if player != null:
		if player.name == "Kyle" && Input.is_action_just_pressed("interact") && $EndInteractionTimer.is_stopped():
			dialogOpen = true
			emit_signal("open_dialog", text_file)
			print("Sending Signal")



func _on_body_exited(body: Node2D) -> void:
	player = null
	print(player)


func _on_body_entered(body: Node2D) -> void:
	player = body
	if player.name == "Kyle":
		print("In interaction range")


func _on_hud_just_ended_dialog() -> void:
	$EndInteractionTimer.start()
