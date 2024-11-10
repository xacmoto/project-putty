extends Node2D
@onready var rightclickGUIresource = preload("res://data/scripts/rightclick_gui.tscn")
@onready var rightclickGUI = rightclickGUIresource.instantiate()
var guiPresent = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event) -> void:
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		$"../../../SFX".CurrentSound = 4
		$"../../../SFX".Playing = true
		for child in get_children():
			var nodePath = child.get_path()
			if child == rightclickGUI:
				guiPresent = true
				rightclickGUI.position = get_global_mouse_position()
				#print(nodePath)
				#print("spotted")
			else:
				guiPresent = false
				#print(nodePath)
				#print("saw nothing")
		
		if !guiPresent:
			rightclickGUIresource = preload("res://data/scripts/rightclick_gui.tscn")
			rightclickGUI = rightclickGUIresource.instantiate()
			add_child(rightclickGUI)
			guiPresent = true
			rightclickGUI.position = get_global_mouse_position()
	
	if event is InputEventKey and event.key_label == KEY_ESCAPE:
		#print("we here you ",guiPresent )
		
		if guiPresent == true:
			$"../../../SFX".CurrentSound = 2
			$"../../../SFX".Playing = true
			rightclickGUI.queue_free()
			guiPresent = false
