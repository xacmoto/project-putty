extends Node2D
var windowPos: Vector2 = Vector2(0,0)
var mousiePaws: Vector2 = Vector2(0,0)
var mode = false
var window = get_window()
var aVar: Vector2 = Vector2(0,0)
func _ready() -> void:
	window = get_window()
	

func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mode = true
			windowPos = window.position
			mousiePaws = DisplayServer.mouse_get_position()
			aVar = mousiePaws - windowPos
			#print(mode, ": mode")
		else:
			mode = false
			#print(mode, ": mode")
	
	if  event is InputEventMouseMotion and mode:
		$"../SFX".CurrentSound = 3
		$"../SFX".Playing = true
		mousiePaws = DisplayServer.mouse_get_position()
		DisplayServer.window_set_position(mousiePaws - aVar)
