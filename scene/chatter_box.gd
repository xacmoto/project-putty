extends Node2D
var randNum = 1
var elapsedTime: float = 0
@onready var streamer = $stream
var source = preload("res://data/audio/runsoslow.ogg")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	pass # Replace with function body.

func get_random_int_in_range(min: int, max: int) -> int:
	return randi() % (max - min + 1) + min


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsedTime += delta
	if elapsedTime > randNum:
		streamer.stream = source
		if !streamer.is_playing():
			streamer.play()
		randNum = get_random_int_in_range(5, 600)
		elapsedTime = 0
