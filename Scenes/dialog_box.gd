extends TextureRect


signal endDialog

var textOpen : bool = false

var boxText
var boxPFP
var boxSpeaker

var text
var textSize
var currentPage


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boxText = $Text
	boxPFP = $ProfilePic
	boxSpeaker = $"Speaker Name"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func  _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") && textOpen == true:
		if currentPage < textSize - 1:
			currentPage += 1
			print("Changing page to ", currentPage)
			Change_Page(currentPage)
		elif currentPage == textSize - 1:
			End_Dialog()
		print(currentPage)




func _on_hud_start_dialogue(textResource) -> void:
	Start_Dialogue(textResource)


func Start_Dialogue(textResource):
	print("Running Start_Dialogue")
	
	textOpen = true
	currentPage = 0
	text = textResource
	textSize = text.pages.size()
	Change_Page(currentPage)
	print("currant page = ", text.pages[currentPage])
	print("number of pages = ", textSize)

func Change_Page(page):
	boxText.text = text.pages[page]
	boxSpeaker.text = text.speaker_name[page]
	boxPFP.texture = text.pfp[page]

func End_Dialog():
	textOpen = false
	print("ending dialog")
	emit_signal("endDialog")
