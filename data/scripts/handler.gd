extends Node2D
@onready var parent = $".."
@onready var gui = $"../ColorRect"
@onready var guiChildren = gui.get_children()
@onready var currentCount = null
var totalHeight = 0

func _ready() -> void:
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("hook")
	var lastChildHeight = 10
	var lastChild = null
	totalHeight = 0
	for child in guiChildren:
		#print("working ",child)
		if child is RichTextLabel:
			child.size.x = gui.size.x * 0.85
		else:
			child.size = gui.size * 0.75
		child.position.x = (gui.size.x * 0.01) + 5
		child.position.y = lastChildHeight
		lastChild = child
		if lastChild != null:
			if lastChild is RichTextLabel:
				lastChildHeight = lastChild.get_content_height() + lastChild.position.y
				totalHeight += lastChild.get_content_height()
			else:
				lastChildHeight = lastChild.position.y 
				totalHeight += lastChildHeight
	currentCount = gui.get_children()
