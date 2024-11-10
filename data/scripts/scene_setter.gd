extends Node2D
@onready var pettyPutty = $"../Putty"
@onready var window = get_window()

func _ready() -> void:
	get_viewport().transparent_bg = true
	pass # Replace with function body.


func _process(delta: float) -> void:
	window = get_window()
	var vp_size = get_viewport().size
	var obj_size = pettyPutty.texture.get_size()
	var relative_scale_x = vp_size.x / obj_size.x
	var relative_scale_y = vp_size.y / obj_size.y
	pettyPutty.scale = Vector2(relative_scale_x, relative_scale_y)
	pass
