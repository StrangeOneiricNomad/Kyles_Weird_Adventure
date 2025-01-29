extends CharacterBody2D


var moveDisabled : bool = false

@export var walkSpeed : float = 100.0
@export var runSpeed : float = 200.0
var collider
var animator
#var ray : RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collider = $KyleColider
	animator = $KyleAnim
	#ray = $Facing





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	
	if Input.is_action_just_pressed("interact"):
		pass
		
func _physics_process(delta: float) -> void:
	
	#get input
	velocity.x = int(Input.is_action_pressed("move_right")) + -int(Input.is_action_pressed("move_left"))
	velocity.y = -int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	# check if running
	if Input.is_action_pressed("run"):
		velocity *= runSpeed
	else:
		velocity *= walkSpeed
		
	velocity.normalized()
	 
	#print("X = " + str(velocity.x))
	#print(" = " + str(velocity.y))
	
	if ! moveDisabled:
		move_and_slide()
	
	
	
	



func _on_hud_enable_movement() -> void:
	moveDisabled = false


func _on_hud_disable_movement() -> void:
	moveDisabled = true
